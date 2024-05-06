function out = find_balls(img)

    %% Close the objects to make them fuller
    se = strel('disk', 4);
    img = imclose(img, se);
    img = imfill(img, 'holes');
    
    %% Make the objects convex (to get rid of the holes in the balls)
    cc1 = bwconncomp(img);
    stats1 = regionprops(cc1, 'ConvexHull');

    convex_image = false(size(img));
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
    stats2 = regionprops(cc2, 'Area', 'Centroid', 'Extent');
    
    y = [stats2.Centroid];
    y = y(2:2:end);
    
    % Create a new binary image where only the elliptical objects are included
    elliptical_objects = ismember(labelmatrix(cc2), find((325 < [stats2.Area] & [stats2.Area] < 2600) & (height(img)*0.45 < y) & [stats2.Extent] > 0.6));
    % imshow(elliptical_objects)

    out = elliptical_objects;
end