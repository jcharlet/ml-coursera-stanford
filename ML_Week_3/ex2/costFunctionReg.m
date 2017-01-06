function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
%grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

unregTheta=0; %WHY ???????
regTheta=theta(2:size(theta));

J=1/m*(-y'*log(sigmoid(X*theta))-(1-y)'*log(1-sigmoid(X*theta)))+lambda/(2*m)*regTheta'*regTheta;

unregX=X(:,1);
regX=X(:,2:size(theta));

unregGrad=1/m*unregX'*(sigmoid(X*theta)-y);

regGrad=1/m*regX'*(sigmoid(X*theta)-y)+lambda/m*regTheta;

grad = [unregGrad; regGrad];
%theta(1)=0;
%grad = 1/m*X'*(sigmoid(X*theta)-y)+lambda/m*theta;


% =============================================================

end