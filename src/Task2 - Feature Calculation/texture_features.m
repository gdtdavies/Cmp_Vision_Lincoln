function [features, averages, ranges] = texture_features(RGB_path, GT_path)
    orientations = [0, 45, 90, 135];
    
    %constants
    NUM_IMGS = 63;
    NUM_ORIENTATIONS = length(orientations);
    NUM_CHANNELS = 3;
    NUM_BALLS = 3;
    NUM_FEATURES = 3;

    num_cols = NUM_IMGS * NUM_ORIENTATIONS * NUM_CHANNELS;
    num_rows = NUM_FEATURES * NUM_BALLS;

    features = zeros(num_cols, num_rows);
    averages = zeros(num_cols/NUM_ORIENTATIONS, num_rows);
    ranges = zeros(num_cols/NUM_ORIENTATIONS, num_rows);

    % go through all the images (i for image)
    for i = 54:116 
        % read the images
        img_RGB = imread([RGB_path 'frame-' num2str(i) '.png']);
        img_GT = imread([GT_path 'frame-' num2str(i) '_GT.png']);

        % extract the coordinates of the of the balls from the ground truth
        cc = bwconncomp(img_GT);
        stats = regionprops(cc, 'BoundingBox', 'Area');

        % for each ball in the image (b for ball)
        for b = 1:cc.NumObjects 
            % extract the ball from the image
            bbox = stats(b).BoundingBox;
            ball = imcrop(img_RGB, bbox);

            area = stats(b).Area;

            % for each colour channel (c for channel)
            for c = 1:3
                channel_features = zeros(numel(orientations), 3); 

                % for each of the 4 orientations (o for orientation)
                for o = 1:length(orientations) 
                    % rotate the grayscale image and calculate the GLCM
                    rotated_img = imrotate(ball(:,:,c), orientations(o));
                    glcm = graycomatrix(rotated_img, 'NumLevels', 256);
                    
                    % extract the texture features (angular second moment (energy), contrast, and correlation)
                    stats2 = graycoprops(glcm, {'energy', 'contrast', 'correlation'});
                    asm = stats2.Energy;
                    contrast = stats2.Contrast;
                    correlation = stats2.Correlation;
                    
                    % store the features in the features matrix
                    channel_features(o, :) = [asm, contrast, correlation]; 
                end
                
                feat_idx = (i-54) * NUM_ORIENTATIONS * NUM_CHANNELS + (c-1) * NUM_ORIENTATIONS + 1;
                idx = (i-54) * NUM_CHANNELS + (c-1) + 1;

                if area < 500
                    features(feat_idx:feat_idx+NUM_ORIENTATIONS-1, 1:3) = channel_features; 
                    averages(idx, 1:3) = [mean(channel_features, 1)];
                    ranges(idx, 1:3) = [range(channel_features, 1)];
                elseif area > 1350
                    features(feat_idx:feat_idx+NUM_ORIENTATIONS-1, 7:9) = channel_features; 
                    averages(idx, 7:9) = [mean(channel_features, 1)];
                    ranges(idx, 7:9) = [range(channel_features, 1)];
                else
                    features(feat_idx:feat_idx+NUM_ORIENTATIONS-1, 4:6) = channel_features; 
                    averages(idx, 4:6) = [mean(channel_features, 1)];
                    ranges(idx, 4:6) = [range(channel_features, 1)];
                end
            end
        end
    end
end