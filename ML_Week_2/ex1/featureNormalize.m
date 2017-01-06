function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly

mu = mean(X);
sigma = std(X);

X_norm = [];
nbFeatures=size(X,2)-1;
for featureIndex = 1:(nbFeatures+1)
  X_norm = [ X_norm (X(:,featureIndex) - mu(:,featureIndex))/sigma(:,featureIndex)];
end

% X_norm = [ X(:,1) (X(:,2) - mu(:,2))/sigma(:,2)  (X(:,3) - mu(:,3))/sigma(:,3)]

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       









% ============================================================

end
