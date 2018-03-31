%% Initialization
clear ; close all; clc

load('data1.mat');

m = size(X,1);
theta=regTrain([ones(m,1) X X.^2],y,1,'M');

%  Plot fit over the data
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
hold on;
plot(X, [ones(m, 1) X X.^2]*theta, 'bx', 'MarkerSize', 20, 'LineWidth', 1.5)
hold off;
% fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
