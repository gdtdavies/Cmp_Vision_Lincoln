%loop through all the images in ../../data/ball_frames
images_GT = dir('../../data/ball_frames/ground_truth/*.png');
images = dir('../../data/ball_frames/original/*.png');
out_dir = '../../data/ball_frames/mask/';

for i = 1:length(images)
    %read the image
    img = imread(images(i).folder + "/" + images(i).name);
    
    %% theshold the balls individually by colour then combine them (DS = 0.84)
    % hsv_img = rgb2hsv(img);
    
    % tennis_mask = mask_tennisball(hsv_img);
    % football_mask = mask_football(img);
    % american_fb_mask = mask_american_football(hsv_img);
    
    % balls_mask = tennis_mask | football_mask | american_fb_mask;
    
    %% theshold the entire image and find the balls (DS = 0.90)
    % binarise the image using ostu thesholding (only use the red channel as it works best for the balls)
    otsu_mask = imbinarize(img(:, :, 1), 'adaptive', 'Sensitivity', 0.35);
    
    % find the balls in the image
    balls_mask = find_balls(otsu_mask);
    
    %% save the mask
    imshow(balls_mask)
    % imwrite(balls_mask, fullfile(out_dir, images(i).name));
end
close("all")
