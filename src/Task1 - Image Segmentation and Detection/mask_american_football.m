function american_fb = mask_american_football(img)
    % Create a binary mask for the american football
    mask = img(:, :, 1) > 0.03 & 0.05 > img(:, :, 1) & img(:, :, 3) > 0.70 & 1 > img(:, :, 3);

    % Close the objects to make them fuller
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

    %% Remove objects that are too small or too large, and are too high
    cc2 = bwconncomp(convex_image);
    stats2 = regionprops(cc2, 'Area', 'Centroid');

    y = [stats2.Centroid];
    y = y(2:2:end);

    american_fb = ismember(labelmatrix(cc2), find([stats2.Area] < 2600 & [stats2.Area] > 900 & (height(img)*0.45 < y)));
end