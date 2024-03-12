% Implement a Kalman filter from scratch (not using  any method/class from pre-built libraries) 
% that  accepts  as  input  the  noisy  coordinates  [na,nb]  and  produces  as  output  the  estimated 
% coordinates [x*,y*]. For this, you should use a Constant Velocity motion model F with constant 
% time intervals Δt = 0.5 and a Cartesian observation model H. The covariance matrices Q and R 
% of the respective noises are the following:

%      |- 0.16   0    0    0  -|
%  Q = |    0  0.36   0    0   |  R = | 0.25   0  |
%      |    0    0  0.16   0   |      |   0  0.25 |
%      |-   0    0    0  0.36 -| 

% real coordinates [x, y] of the football
X = dir('../../data/x.csv'); 
Y = dir('../../data/y.csv');

% noisy version provided by some segmentation and recognition for the football
noisy_X = dir('../../data/na.csv');
noisy_Y = dir('../../data/nb.csv');

X_primes = zeros(size(X));
Y_primes = zeros(size(Y));
for l=1:length(noisy_X)
    [X_primes, Y_primes] = kalman_filter(noisy_X, noisy_Y)
end


% 1) You should plot the estimated trajectory of coordinates [x*,y*], together with the real [x,y] 
% and the noisy ones [a,b] for comparison. Discuss how you arrive to the solution.


% 2) You  should  also  assess  the  quality  of  the  tracking  by  calculating  the  mean  and  standard 
% deviation of the Root Mean Squared error (include the mathematical formulas you used for 
% the error calculation in your report). Compare both noisy and estimated coordinates to the 
% ground truth. Adjust the parameters associated with the Kalman filter,  justify any choices 
% of  parameter(s)  associated  with  Kalman  Filter  that  can  give  you  better  estimation  of  the 
% coordinates  that  are  closer  to  the  ground  truth.  Discuss  and  justify  your  findings  in  the 
% report. 