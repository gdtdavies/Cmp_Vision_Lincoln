GT_path = '../../data/ball_frames/ground_truth/';
mask_path ='../../data/ball_frames/mask/';

DS = zeros(1, 63);

for i = 54:116
    % Load the segmented ball region (M) and the ground-truth binary ball mask (S)
    M = imread([mask_path 'frame-' num2str(i) '.png']);
    S = imread([GT_path 'frame-' num2str(i) '_GT.png']);

    % Convert the grayscale images to binary images
    M = imbinarize(uint8(M));
    S = imbinarize(uint8(S));

    % Calculate the intersection between M and S
    intersection = sum(sum(M & S));

    % Calculate the size of M and S
    size_M = sum(sum(M));
    size_S = sum(sum(S));

    % Calculate the Dice Similarity Score (DS)
    DS(i-53) = 2 * intersection ./ (size_M + size_S);
end

% Calculate the average and standard deviation of the Dice Similarity Score
avg_DS = mean(DS);
std_DS = std(DS);
disp(['The average Dice Similarity Score for the ball images is ' num2str(avg_DS)]);
disp(['The standard deviation of the Dice Similarity Score for the ball images is ' num2str(std_DS)]);

plot_DS(DS);


% Calculate the mean and standard deviation of DS
mean_DS = mean(DS);
std_DS = std(DS);

% Sort the DS array in ascending order
[sorted_DS, sorted_indices] = sort(DS);

% Display the worst 5 segmented ball images and their corresponding GT mask images
plot_imgs(sorted_indices, DS, 'worst');

% Display the best 5 segmented ball images and their corresponding GT mask images
plot_imgs(sorted_indices, DS, 'best');

