function output( pred )
%OUTPUT Summary of this function goes here
%   Detailed explanation goes here
load('test_id.mat');
output_m = [test_id,pred];
csvwrite('test_pred.csv',output_m);

end

