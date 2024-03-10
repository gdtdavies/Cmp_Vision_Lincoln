function [ball1, ball2, ball3] = shape_features(GT_path)
    ball1 = struct('Solidity', [], 'Eccentricity', [], 'Circularity', [], 'NonCompactness', []);
    ball2 = struct('Solidity', [], 'Eccentricity', [], 'Circularity', [], 'NonCompactness', []);
    ball3 = struct('Solidity', [], 'Eccentricity', [], 'Circularity', [], 'NonCompactness', []);

    for i=54:116
        GT = imread([GT_path 'frame-' num2str(i) '_GT.png']);

        cc = bwconncomp(GT);

        % calculate the shape features for each ball patch (solidity, non-compactness, circularity, eccentricity)
        stats = regionprops(cc, 'Solidity', 'Eccentricity', 'Circularity', 'BoundingBox', 'Area');
        
        for j=1:cc.NumObjects
            solidity = stats(j).Solidity;
            eccentricity = stats(j).Eccentricity;
            circularity = stats(j).Circularity;
            bbox = stats(j).BoundingBox;
            area = stats(j).Area;

            bbox_area = bbox(3)*bbox(4);

            non_compactness = 1-((area)/bbox_area);

            if area < 500
                ball1.Solidity = [ball1.Solidity; solidity];
                ball1.Eccentricity = [ball1.Eccentricity; eccentricity];
                ball1.Circularity = [ball1.Circularity; circularity];
                ball1.NonCompactness = [ball1.NonCompactness; non_compactness];
            elseif area > 1500
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

    % plot the distribution of all the four features, per ball type
    figure;
    subplot(2,2,1), histogram(ball1.Solidity, 20),       title('Solidity - Ball 1');
    subplot(2,2,2), histogram(ball1.Eccentricity, 20),   title('Eccentricity - Ball 1');
    subplot(2,2,3), histogram(ball1.Circularity, 20),    title('Circularity - Ball 1'); 
    subplot(2,2,4), histogram(ball1.NonCompactness, 20), title('Non-Compactness - Ball 1');

    figure;
    subplot(2,2,1), histogram(ball2.Solidity, 20),       title('Solidity - Ball 2');
    subplot(2,2,2), histogram(ball2.Eccentricity, 20),   title('Eccentricity - Ball 2');
    subplot(2,2,3), histogram(ball2.Circularity, 20),    title('Circularity - Ball 2');
    subplot(2,2,4), histogram(ball2.NonCompactness, 20), title('Non-Compactness - Ball 2');

    figure;
    subplot(2,2,1), histogram(ball3.Solidity, 20),       title('Solidity - Ball 3');
    subplot(2,2,2), histogram(ball3.Eccentricity, 20),   title('Eccentricity - Ball 3');
    subplot(2,2,3), histogram(ball3.Circularity, 20),    title('Circularity - Ball 3');
    subplot(2,2,4), histogram(ball3.NonCompactness, 20), title('Non-Compactness - Ball 3');
end