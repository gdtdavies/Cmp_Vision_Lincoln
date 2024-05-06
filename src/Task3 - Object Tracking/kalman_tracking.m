function [px, py] = kalman_tracking(z)
    % Track a target with a Kalman filter
    % z: observation vector
    % Return the estimated state position coordinates (px,py)

    dt = 0.5; % time interval
    N = length(z); % number of samples

    F = [1 dt 0 0; 0 1 0 0; 0 0 1 dt; 0 0 0 1]; % Constant Velocity motion model 
    H = [1 0 0 0; 0 0 1 0]; % Cartesian observation model
    
    Q = [0.16 0 0 0; 0 0.36 0 0; 0 0 0.16 0; 0 0 0 0.36]; % motion noise
    R = [0.25 0; 0 0.25]; % observation noise
    
    x = [z(1,1); 0; z(2,1); 0]; % initial state
    % x = [0 0 0 0]'; % initial state
    P = Q; % initial state covariance

    s = zeros(4,N);

    for i = 1 : N
        [xp, Pp] = kalman_predict(x, P, F, Q);
        [x, P] = kalman_update(xp, Pp, H, R, z(:,i));
        s(:,i) = x; % save current state
    end

    px = s(1,:); % NOTE: s(2, :) and s(4, :), not considered here,
    py = s(3,:); % contain the velocities on x and y respectively
end