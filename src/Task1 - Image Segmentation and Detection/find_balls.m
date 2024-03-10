function out = find_balls(img)

    %% Pad the objects to make them more circular
    
    se = strel('disk', 3);
    img = imclose(img, se);
    img = imfill(img, 'holes');
    
    %% Make the objects convex
    cc1 = bwconncomp(img);
    stats1 = regionprops(cc1, 'ConvexHull');

    convex_image = false(size(img));

    % Loop over each object
    for i = 1:numel(stats1)
        % Get the convex hull for the current object
        convexHull = stats1(i).ConvexHull;     
        % Convert the convex hull to a binary mask
        mask = poly2mask(convexHull(:,1), convexHull(:,2), size(img, 1), size(img, 2));
        
        % Combine the mask with the existing binary image
        convex_image = convex_image | mask;
    end

    %% Remove objects that are too small or too large

    cc2 = bwconncomp(convex_image);
    stats2 = regionprops(cc2, 'Area');

    convex_objects = ismember(labelmatrix(cc2), find(325 < [stats2.Area] & [stats2.Area] < 2300));

    %% Make the objects elliptical

    cc3 = bwconncomp(convex_objects);
    stats3 = regionprops(cc3, 'Centroid', 'MajorAxisLength', 'MinorAxisLength', 'Orientation');

    ellipse_image = false(size(img));
    for i = 1:numel(stats3)
        % Get the properties for the current object
        majorAxis   = stats3(i).MajorAxisLength/2;
        minorAxis   = stats3(i).MinorAxisLength/2;
        centroid    = stats3(i).Centroid;
        orientation = 45 - stats3(i).Orientation; % Correct for the difference in orientation definition

        % Create an ellipse
        t = linspace(0, 2*pi, 100);
        x = centroid(1) + majorAxis*cos(t)*cosd(orientation) - minorAxis*sin(t)*sind(orientation);
        y = centroid(2) + majorAxis*cos(t)*sind(orientation) + minorAxis*sin(t)*cosd(orientation);
        
        % Convert the ellipse to a binary mask
        mask = poly2mask(x, y, size(convex_objects, 1), size(convex_objects, 2));
        
        % Combine the mask with the existing binary image
        ellipse_image = ellipse_image | mask;
    end

    %% Remove objects that are not elliptical and are too high
    
    cc4    = bwconncomp(ellipse_image);
    stats4 = regionprops(cc4, 'Eccentricity', 'Centroid');

    y_coords = [stats4.Centroid];
    y_coords = y_coords(2:2:end);
    
    % Create a new binary image where only the elliptical objects are included
    elliptical_objects = ismember(labelmatrix(cc4), find([stats4.Eccentricity] < 0.85 & (height(img)*0.45 < y_coords)));

    out = elliptical_objects;
end