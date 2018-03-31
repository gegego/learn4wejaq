%% Initialization
clear ; close all; clc

data = load('data2.txt');
X = data(:, [1, 2]); y = data(:, 3);

X = mapFeature(X(:,1), X(:,2));

theta=regTrain(X,y,1,'L');

% Compute accuracy on our training set
p = regPredict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
