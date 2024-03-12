% https://uk.mathworks.com/help/control/ug/kalman-filtering.html 

function [x_prime, y_prime] = kalman_filter(na, nb)

    DELTA_T = 0,5

    Q = [0.16, 0, 0, 0; 0, 0.36, 0, 0; 0, 0, 0.16, 0; 0, 0, 0, 0.36];
    R = [0.25, 0; 0, 0.25];

%    1. Initialize the state of the filter
%    2. Initialize our belief in the state
%    3. For each observed measurement:
%       1. Predict the state at the next time step
%       2. Adjust the belief to account for the uncertainty in prediction
%       3. Get a measurement and associated belief about its accuracy
%       4. Compute residual between estimated state and measurement
%       5. Compute scaling factor based on whether the measurement or prediction is more accurate
%       6. Update the state estimate based on measurement residual scaled by the scaling factor
%       7. Update belief in the state based on how certain we are in the measurement
%    4. Return the final state estimate

end