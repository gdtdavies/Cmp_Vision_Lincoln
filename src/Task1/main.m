%loop through all the images in ../../data/ball_frames
images_GT = dir('../../data/ball_frames/ground_truth/*.png');
images = dir('../../data/ball_frames/*.png');
for i = 1:length(images)
    %read the image
    img = imread(images(i).folder + "/" + images(i).name);
    
    %convert the image to grayscale
    %img = rgb2gray(img);
    
    %display the image
    imshow(img);
end