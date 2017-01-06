function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%
% theta=zeros(400,1)
% h=sigmoid(X*theta)

% J=1/m*(-y'*log(h)-(ones(5000,1)-y)'*log(ones(5000,1)-h));
% grad=


unregTheta=0; %WHY ???????
regTheta=theta(2:size(theta));

J=1/m*(-y'*log(sigmoid(X*theta))-(1-y)'*log(1-sigmoid(X*theta)))+lambda/(2*m)*regTheta'*regTheta;

unregX=X(:,1);
regX=X(:,2:size(theta));

unregGrad=1/m*unregX'*(sigmoid(X*theta)-y);

regGrad=1/m*regX'*(sigmoid(X*theta)-y)+lambda/m*regTheta;

grad = [unregGrad; regGrad];





% =============================================================

% grad = grad(:);

end
