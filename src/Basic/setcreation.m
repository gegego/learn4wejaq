function [ X,Y,CV_X,CV_Y ] = setcreation( feature, trainy )
%SETCREATION Summary of this function goes here
%   Detailed explanation goes here

r = randi(8000,1,10);
C = size(feature,2);
CV_X = zeros(2500,C);
CV_Y = zeros(2500,1);
for i=1:10
    CV_X((i-1)*250+1:i*250,:)=feature(r(i):r(i)+249,:);
    CV_Y((i-1)*250+1:i*250,:)=trainy(r(i):r(i)+249,:);
    feature(r(i):r(i)+249,:) = [];
    trainy(r(i):r(i)+249,:) = [];
%     feature = [feature(1:r(i)-1,:), feature(r(i)+250:size(feature,1),:)];
%     trainy = [trainy(1:r(i)-1,:), trainy(r(i)+250:size(trainy,1),:)];
end
X = feature;
Y = trainy;

end

