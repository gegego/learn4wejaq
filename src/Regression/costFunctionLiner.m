function [J, grad] = costFunctionLiner(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));


J = (1/(2*m)) * sum(((X*theta)-y).^2) + (lambda/(2*m))* sum(theta(2:end).^2);


grad(1) = (1/m)* X(:,1)'*((X*theta)-y);

grad(2:end) = (1/m)* X(:,2:end)'*((X*theta)-y) + (lambda/m)*theta(2:end,:);

grad = grad(:);

end
