function [ theta ] = regTrain( X,y,lambda, M)
%LRTRAIN Summary of this function goes here
%   Detailed explanation goes here
initial_theta = zeros(size(X, 2), 1);

options = optimset('MaxIter', 400);

if M=='L'
    % Create "short hand" for the cost function to be minimized
    costFunction = @(t)costFunctionLog(t, X, y, lambda);
else
    costFunction = @(t)costFunctionLiner(t, X, y, lambda);
end

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[theta, cost] = fmincg(costFunction, initial_theta, options);

end

