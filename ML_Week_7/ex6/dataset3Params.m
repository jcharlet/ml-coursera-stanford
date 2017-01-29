function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
values = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
predictionError=666;
for i = 1:length(values)
  for j = 1:length(values)
    var_C=values(i);
    var_sigma=values(j);

    model= svmTrain(X, y, var_C, @(x1, x2) gaussianKernel(x1, x2, var_sigma)); 
    
    predictions = svmPredict(model, Xval); 
    var_predictionError = mean(double(predictions ~= yval));
    
    
    fprintf("C: %f, sigma:%f => error: %f", values(i), values(j), var_predictionError);
    
    if  predictionError==666 || var_predictionError<predictionError
      predictionError=var_predictionError;
      
      C=var_C;
      sigma=var_sigma;
      fprintf("\n ###### SMALLER ######## \n");
    endif
  end
end

fprintf("C: %f , sigma: %f", C, sigma);





% =========================================================================

end