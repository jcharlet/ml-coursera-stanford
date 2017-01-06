function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
%g = zeros(size(z));
g=[];
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).


for i=1:size(z,1)
  gLine=[];
  for j=1:size(z,2)
    gLine = [gLine 1/(1+e^(-z(i,j)))];
  end  
  g = [g ; gLine];
end


% =============================================================

end
