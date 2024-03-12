%loop through all the images in ../../data/ball_frames
images_GT = dir('../../data/ball_frames/ground_truth/*.png');
images = dir('../../data/ball_frames/original/*.png');
out_dir = '../../data/ball_frames/mask/';

for i = 1:length(images)
    %read the image
    img = imread(images(i).folder + "/" + images(i).name);
    
    %binarise the image using ostu thesholding (only use the red channel as it works best for the balls)
    otsu_mask = otsu_thesh(img(:, :, 1));
    
    %find the balls in the image
    balls_mask = find_balls(otsu_mask);

    %save the mask  
    imwrite(balls_mask, fullfile(out_dir, images(i).name));
end
close("all")
