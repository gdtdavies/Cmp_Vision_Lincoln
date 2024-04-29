function tennis = mask_tennisball(img)
    % Create a binary mask for the tennis ball
    mask = img(:, :, 1) > 0.08 & img(:, :, 1) < 0.16 & img(:, :, 2) > 0.7 & img(:, :, 3) > 0.7;

    % Close the objects to make them fuller
    se = strel('disk', 4);
    mask = imclose(mask, se);
    mask = imfill(mask, 'holes');

    % Draw a disk with center point at the centroid and diameter as the major axis
    cc = bwconncomp(mask);
    stats = regionprops(cc, 'Centroid', 'MajorAxisLength');
    tennis = false(size(mask));
    for i = 1:numel(stats)
        centroid = stats(i).Centroid;
        maj_AL = stats(i).MajorAxisLength;
        radius = maj_AL / 2;
        centerX = centroid(1);
        centerY = centroid(2);
        
        % Create a grid of points within the disk
        [x, y] = meshgrid(1:size(img, 2), 1:size(img, 1));
        distance = sqrt((x - centerX).^2 + (y - centerY).^2);
        
        % Create a binary mask for the disk
        tennis = distance <= radius;     
    end
end