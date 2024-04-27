function [xe, Pe] = kalman_update(x, P, H, R, z)
    % Update step of Kalman filter.
    % x: state vector
    % P: covariance matrix of x
    % H: matrix of observation model
    % R: matrix of observation noise
    % z: observation vector

    % Return estimated state vector xe and covariance Pe
    S = H * P * H' + R; % innovation covariance
    K = P * H' * inv(S); % Kalman gain
    zp = H * x; % predicted observation

    %%%%%%%%% UNCOMMENT FOR VALIDATION GATING %%%%%%%%%%
    % gate = (z - zp)' * inv(S) * (z - zp);
    % if gate > 9.21
    %     warning('Observation outside validation gate');
    %     xe = x;
    %     Pe = P;
    %     return
    % end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    xe = x + K * (z - zp); % estimated state
    Pe = P - K * S * K'; % estimated covariance
end