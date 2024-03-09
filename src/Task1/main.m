%loop through all the images in ../../data/ball_frames
images_GT = dir('../../data/ball_frames/ground_truth/*.png');
images = dir('../../data/ball_frames/*.png');

while true
    for i = 1:length(images)
        %read the image
        img = imread(images(i).folder + "/" + images(i).name);
        
        %binarise the image using ostu thesholding (only use the red channel as it works best for the balls)
        otsu_mask = otsu_thesh(img(:, :, 1));
        
        %find the balls in the image
        balls_mask = find_balls(otsu_mask);
        imshow(img);
        imshow(balls_mask);
    end
end