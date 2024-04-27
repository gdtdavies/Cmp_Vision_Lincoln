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

figure;
plot(x, y, 'r', 'LineWidth', 0.5);
hold on;
plot(na, nb, 'bx', 'MarkerSize', 5);
plot(x_, y_, 'g', 'LineWidth', 0.5);
legend('Real', 'Noisy', 'Estimated');
xlabel('x');
ylabel('y');
title('Real, Noisy and Estimated Coordinates');
hold off;


%% 2) You  should  also  assess  the  quality  of  the  tracking  by  calculating  the  mean  and  standard 
% deviation of the Root Mean Squared error (include the mathematical formulas you used for 
% the error calculation in your report). Compare both noisy and estimated coordinates to the 
% ground truth. Adjust the parameters associated with the Kalman filter,  justify any choices 
% of  parameter(s)  associated  with  Kalman  Filter  that  can  give  you  better  estimation  of  the 
% coordinates  that  are  closer  to  the  ground  truth.  Discuss  and  justify  your  findings  in  the 
% report. 

% Root Mean Squared Error (RMSE) calculation
rmse_na = sqrt(mean((na - x).^2 + (nb - y).^2));
rmse_x = sqrt(mean((x_ - x).^2 + (y_ - y).^2));

% Standard deviation calculation of the RMSE
std_na = std(sqrt((na - x).^2 + (nb - y).^2));
std_x = std(sqrt((x_ - x).^2 + (y_ - y).^2));

fprintf('RMSE for noisy coordinates: %f\n', rmse_na);
fprintf('RMSE for estimated coordinates: %f\n', rmse_x);
fprintf('Standard deviation for noisy coordinates: %f\n', std_na);
fprintf('Standard deviation for estimated coordinates: %f\n', std_x);

