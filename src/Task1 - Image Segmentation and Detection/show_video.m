images = dir('../../data/ball_frames/mask/*.png');

while true
    for i=1:length(images)
        img = imread(images(i).folder + "/" + images(i).name);
        imshow(img);
    end
end

