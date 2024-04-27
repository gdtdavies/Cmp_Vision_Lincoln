% https://uk.mathworks.com/help/control/ug/kalman-filtering.html 

function [xp, Pp] = kalman_predict(x, P, F, Q)

    % Prediction step of Kalman filter.
    % x: state vector
    % P: covariance matrix of x
    % F: matrix of motion model
    % Q: matrix of motion noise
    % Return predicted state vector xp and covariance Pp
    xp = F * x; % predict state
    Pp = F * P * F' + Q; % predict state covariance
end