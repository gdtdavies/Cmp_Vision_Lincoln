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

    %figure('Name', 'averages');
    %subplot(2, 2, 1);
    %histogram(ball1.Solidity, 10, 'FaceColor', [0.87 1.0 0.31], 'EdgeColor', 'none');
    %hold on;
    %histogram(ball2.Solidity, 10, 'FaceColor', 'b', 'EdgeColor', 'none');
    %histogram(ball3.Solidity, 10, 'FaceColor', [0.4 0.2 0], 'EdgeColor', 'none');
    %title('Solidity');
    %legend('Tennis', 'Football', 'American');
    %
    %subplot(2, 2, 2);
    %histogram(ball1.Eccentricity, 10, 'FaceColor', [0.87 1.0 0.31], 'EdgeColor', 'none');
    %hold on;
    %histogram(ball2.Eccentricity, 10, 'FaceColor', 'b', 'EdgeColor', 'none');
    %histogram(ball3.Eccentricity, 10, 'FaceColor', [0.4 0.2 0], 'EdgeColor', 'none');
    %title('Eccentricity');
    %legend('Tennis', 'Football', 'American');
    %hold off;
%
    %subplot(2, 2, 3);
    %histogram(ball1.Circularity, 10, 'FaceColor', [0.87 1.0 0.31], 'EdgeColor', 'none');
    %hold on;
    %histogram(ball2.Circularity, 10, 'FaceColor', 'b', 'EdgeColor', 'none');
    %histogram(ball3.Circularity, 10, 'FaceColor', [0.4 0.2 0], 'EdgeColor', 'none');
    %title('Circularity');
    %legend('Tennis', 'Football', 'American');
    %hold off;
%
    %subplot(2, 2, 4);
    %histogram(ball1.NonCompactness, 10, 'FaceColor', [0.87 1.0 0.31], 'EdgeColor', 'none');
    %hold on;
    %histogram(ball2.NonCompactness, 10, 'FaceColor', 'b', 'EdgeColor', 'none');
    %histogram(ball3.NonCompactness, 10, 'FaceColor', [0.4 0.2 0], 'EdgeColor', 'none');
    %title('Non-Compactness');
    %legend('Tennis', 'Football', 'American');
    %hold off;
end