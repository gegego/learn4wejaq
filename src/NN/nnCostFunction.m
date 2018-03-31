function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
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

X = [ones(m,1) X];

I = eye(num_labels);
Y = zeros(m, num_labels);
for i=1:m
   Y(i, :) = I(y(i),:);
end

a1 =X;
z2 = a1*Theta1';
a2 = [ones(size(z2,1), 1) sigmoid(z2)];
z3 = a2*Theta2';
a3 = sigmoid(z3);

h = a3;

p = sum(sum(Theta1(:,2:end).^2))+sum(sum(Theta2(:,2:end).^2));

J = sum(sum((-Y).*log(h)-(1-Y).*log(1-h)))/m + (lambda*p)/(2*m);


errordelta3 = a3-Y;
errordelta2 = (errordelta3*Theta2).*sigmoidGradient([ones(size(z2, 1), 1) z2]);
errordelta2 = errordelta2(:,2:end);

delta1 = errordelta2'*a1;
delta2 = errordelta3'*a2;

p1 = [zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];
p2 = [zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];

Theta1_grad = delta1./m + (lambda*p1)/m;
Theta2_grad = delta2./m + (lambda*p2)/m;

grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
