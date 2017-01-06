function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

[theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

% Initialize some useful values
% m = length(y); % number of training examples

% nbFeatures=size(X,2)-1

% J_history = zeros(num_iters, nbFeatures);

% for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %




    % theta=theta - alpha/m*X'*(X*theta-y);
    
    % disp("iteration = ");disp(iter);
    % disp("cost = ");disp(computeCostMulti(X,y,theta));





    % ============================================================

    % Save the cost J in every iteration    
    % J_history(iter,:) = computeCostMulti(X, y, theta);

% end

end
