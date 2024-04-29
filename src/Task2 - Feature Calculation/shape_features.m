function [ball1, ball2, ball3] = shape_features(GT_path)
    ball1 = struct('Solidity', [], 'Eccentricity', [], 'Circularity', [], 'NonCompactness', []);
    ball2 = struct('Solidity', [], 'Eccentricity', [], 'Circularity', [], 'NonCompactness', []);
    ball3 = struct('Solidity', [], 'Eccentricity', [], 'Circularity', [], 'NonCompactness', []);

    for i=54:116
        GT = imread([GT_path 'frame-' num2str(i) '_GT.png']);

        cc = bwconncomp(GT);

        % calculate the shape features for each ball patch (solidity, non-compactness, circularity, eccentricity)
        stats = regionprops(cc, 'Solidity', 'Eccentricity', 'Circularity', 'Extent', 'Area');
        
        for j=1:cc.NumObjects
            solidity = stats(j).Solidity;
            eccentricity = stats(j).Eccentricity;
            circularity = stats(j).Circularity;
            extent = stats(j).Extent;
            area = stats(j).Area;

            non_compactness = 1-extent;

            if area < 500
                ball1.Solidity = [ball1.Solidity; solidity];
                ball1.Eccentricity = [ball1.Eccentricity; eccentricity];
                ball1.Circularity = [ball1.Circularity; circularity];
                ball1.NonCompactness = [ball1.NonCompactness; non_compactness];
            elseif area > 1350
                ball3.Solidity = [ball3.Solidity; solidity];
                ball3.Eccentricity = [ball3.Eccentricity; eccentricity];
                ball3.Circularity = [ball3.Circularity; circularity];
                ball3.NonCompactness = [ball3.NonCompactness; non_compactness];
            else
                ball2.Solidity = [ball2.Solidity; solidity];
                ball2.Eccentricity = [ball2.Eccentricity; eccentricity];
                ball2.Circularity = [ball2.Circularity; circularity];
                ball2.NonCompactness = [ball2.NonCompactness; non_compactness];
            end
        end
    end
end