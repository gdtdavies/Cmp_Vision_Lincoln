% This  part  of  the  assignment  will  deal  with  feature  extraction,  more  specifically  you  will  be 
% examining  texture  and  shape  features.  Using  the  provided  GT  ball  masks  to  obtain  the 
% corresponding ball patches from original RGB images, carrying out the following tasks.  

GT_path = '../../data/ball_frames/ground_truth/';
RGB_path = '../../data/ball_frames/original';

%% Shape features

% a)  (shape  features)  For  each  of  the  ball  patches,  calculate  four  different  shape  features 
% discussed in the lectures (solidity, non-compactness, circularity, eccentricity). Plot the 
% distribution of all the four features, per ball type.

% [ball1, ball2, ball3] = shape_features(GT_path);

%% Texture features

% b) (texture features) Calculate the normalised grey-level co-occurrence matrix in four 
% orientations (0°, 45°, 90°, 135°) for the patches from the three balls, separately for each of the 
% colour  channels  (red,  green,  blue).  For  each  orientation,  calculate  the  first  three  features 
% proposed by Haralick et al. (Angular Second Moment, Contrast, Correlation), and produce per-
% patch features by calculating the feature average and range across the 4 orientations. Select 
% one feature from each of the colour channels and plot the distribution per ball type.

[features, averages, ranges] = texture_features(RGB_path, GT_path);

%% Discriminative information

% c)  (discriminative  information)  Based  on  your  visualisations  in  part  a)  and  b),  discuss  which 
% features appear to be best at differentiating between different ball types. For each ball type, 
% are  shape  or  texture  features  more  informative?  Which  ball  type  is  the  easiest/hardest  to 
% distinguish, based on the calculated features? Which other features or types of features would 
% you suggest for the task of differentiating between the different ball types and why?