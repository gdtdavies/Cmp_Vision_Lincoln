function football = mask_football(img)
    % Create a binary mask for the football
    mask = img(:, :, 1) > 150 & img(:, :, 2) > 150 & img(:, :, 3) > 150;

    se = strel('disk', 4);
    mask = imclose(mask, se);
    mask = imfill(mask, 'holes');

    %% Make the objects convex (to get rid of the holes in the balls)
    cc1 = bwconncomp(mask);
    stats1 = regionprops(cc1, 'ConvexHull');

    convex_image = false(size(mask));
    for i = 1:numel(stats1)
        % Get the convex hull for the current object
        convexHull = stats1(i).ConvexHull;     
        % Convert the convex hull to a binary mask
        mask = poly2mask(convexHull(:,1), convexHull(:,2), size(img, 1), size(img, 2));
        % Combine the mask with the existing binary image
        convex_image = convex_image | mask;
    end

    %% Remove objects that are too small or too large, are too high, and have a low area to bbox area ratio
    cc2 = bwconncomp(convex_image);
    stats2 = regionprops(cc2, 'Area', 'Circularity', 'Centroid');

    y = [stats2.Centroid];
    y = y(2:2:end);

    football_mask = ismember(labelmatrix(cc2), find([stats2.Area] < 900 & [stats2.Area] > 400 & [stats2.Circularity] > 0.85 & (height(img)*0.45 < y)));

    %% Draw a disk with center point at the centroid and diameter as the major axis
    cc3 = bwconncomp(football_mask);
    stats3 = regionprops(cc3, 'Centroid', 'MajorAxisLength');
    football = false(size(football_mask));
    for i = 1:numel(stats3)
        centroid = stats3(i).Centroid;
        maj_AL = stats3(i).MajorAxisLength;
        radius = maj_AL / 2;
        centerX = centroid(1);
        centerY = centroid(2);
        
        % Create a grid of points within the disk
        [x, y] = meshgrid(1:size(img, 2), 1:size(img, 1));
        distance = sqrt((x - centerX).^2 + (y - centerY).^2);
        
        % Create a binary mask for the disk
        football = distance <= radius;     
    end
end