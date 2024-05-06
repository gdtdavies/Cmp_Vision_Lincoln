%% Implement a Kalman filter from scratch (not using  any method/class from pre-built libraries) 
% that  accepts  as  input  the  noisy  coordinates  [na,nb]  and  produces  as  output  the  estimated 
% coordinates [x*,y*]. For this, you should use a Constant Velocity motion model F with constant 
% time intervals Δt = 0.5 and a Cartesian observation model H. The covariance matrices Q and R 
% of the respective noises are the following:

%      |- 0.16   0    0    0  -|
%  Q = |    0  0.36   0    0   |  R = | 0.25   0  |
%      |    0    0  0.16   0   |      |   0  0.25 |
%      |-   0    0    0  0.36 -| 

% real coordinates [x, y] of the football
x = readmatrix('../../data/x.csv'); 
y = readmatrix('../../data/y.csv');

% noisy version provided by some segmentation and recognition for the football
na = readmatrix('../../data/na.csv');
nb = readmatrix('../../data/nb.csv');

[x_, y_] = kalman_tracking([na; nb]);

%% 1) You should plot the estimated trajectory of coordinates [x*,y*], together with the real [x,y] 
% and the noisy ones [a,b] for comparison. Discuss how you arrive to the solution.

plot_fig(x, y, na, nb, x_, y_);


%% 2) You  should  also  assess  the  quality  of  the  tracking  by  calculating  the  mean  and  standard 
% deviation of the Root Mean Squared error (include the mathematical formulas you used for 
% the error calculation in your report). Compare both noisy and estimated coordinates to the 
% ground truth. Adjust the parameters associated with the Kalman filter,  justify any choices 
% of  parameter(s)  associated  with  Kalman  Filter  that  can  give  you  better  estimation  of  the 
% coordinates  that  are  closer  to  the  ground  truth.  Discuss  and  justify  your  findings  in  the 
% report. 

% Root Mean Squared Error (RMSE) calculation
rmse_n = sqrt(mean((x - na).^2 + (y - nb).^2));
rmse = sqrt(mean((x - x_).^2 + (y - y_).^2));

% Standard deviation calculation of the RMSE
std_n = std(sqrt((x - na).^2 + (y - nb).^2));
std = std(sqrt((x - x_).^2 + (y - y_).^2));

fprintf('RMSE for noisy coordinates: %f\n', rmse_n);
fprintf('RMSE for estimated coordinates: %f\n', rmse);
fprintf('Standard deviation for noisy coordinates: %f\n', std_n);
fprintf('Standard deviation for estimated coordinates: %f\n', std);

