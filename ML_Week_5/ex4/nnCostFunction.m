function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%

%%% STEP 1
%Step 1 - Expand the 'y' output values into a matrix of single values (see ex4.pdf 
% Page 5). This is most easily done using an eye() matrix of size num_labels, with 
% vectorized indexing by 'y', as in "eye(num_labels)(y,:)". Discussions of this
% and other methods are available in the Course Wiki - Programming Exercises 
% section. A typical variable name would be "y_matrix".
y_matrix=eye(num_labels)(y,:);


%%% STEP 2
% Step 2 - perform the forward propagation:a1 equals the X input matrix with a 
% column of 1's added (bias units)z2 equals the product of a1 and Θ1a2 is the 
% result of passing z2 through g()a2 then has a column of 1st added (bias units)
% z3 equals the product of a2 and Θ2a3 is the result of passing z3 through g()
% Cost Function, non-regularized

%1st layer
a1=[ones(m,1), X];
z2=a1*Theta1';

a2=sigmoid(z2);

%2nd layer
a2=[ones(m,1),a2];

z3=a2*Theta2';
a3 = sigmoid(z3);


%%% STEP 3
% Step 3 - Compute the unregularized cost according to ex4.pdf (top of Page 5),
% (I had a hard time understanding this equation mainly that I had a misconception 
% that y(i)k is a vector, instead it is just simply one number) using a3, your 
% ymatrix, and m (the number of training examples). Cost should be a scalar value. 
% If you get a vector of cost values, you can sum that vector to get the cost.Remember 
% to use element-wise multiplication with the log() function.Now you can run ex4.m 
% to check the unregularized cost is correct, then you can submit Part 1 to the grader.


%J=1/m*(-y'*log(sigmoid(X*theta))-(1-y)'*log(1-sigmoid(X*theta)))+lambda/(2*m)*regTheta'*regTheta;
J=-1/m*sum(sum(y_matrix.*log(a3)+(1-y_matrix).*log(1-a3)));

regTheta1=Theta1(:,2:size(Theta1,2));
regTheta2=Theta2(:,2:size(Theta2,2));


J=J + lambda/(2*m)*(sum(sum(regTheta1.*regTheta1)) + sum(sum(regTheta2.*regTheta2)));

% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%

for t = 1:m
  delta3=a3(t,:)-y_matrix(t,:);
  
  Theta2_grad=Theta2_grad + delta3'*a2(t,:) ;
  
  z2t=z2(t,:);
  
  z_with_bias_unit=[ones(size(z2t,1),1) z2t];
  
  delta2=delta3*Theta2.*sigmoidGradient(z_with_bias_unit);
  delta2 = delta2(2:end);
  
  Theta1_grad=Theta1_grad + delta2'*a1(t,:) ;
  
endfor

% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

Theta2_grad_unreg=Theta2_grad(:,1);
Theta2_grad_reg=Theta2_grad(:,2:end)+lambda*Theta2(:,2:end);

Theta2_grad=(1/m)*[Theta2_grad_unreg Theta2_grad_reg];

Theta1_grad_unreg=Theta1_grad(:,1);
Theta1_grad_reg=Theta1_grad(:,2:end)+lambda*Theta1(:,2:end);
Theta1_grad=(1/m)*[Theta1_grad_unreg Theta1_grad_reg];



% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
