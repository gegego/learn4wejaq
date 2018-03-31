function [ feature ] = preprocess( X, second )
%PREPROCESS Summary of this function goes here
%   Detailed explanation goes here

C = 1440/second;

feature1 = zeros(size(X,1), C * 22);
lastsecond = zeros(size(X,1), 11);
for i=1:C
    for j = 0:second-1
        data = X(:,(i-1)*second*11+j*11+1:(i-1)*second*11+j*11+11) - lastsecond;
        homedata = data;
        homedata(homedata<0) = 0;
        feature1(:,(i-1)*22+1:2:(i-1)*22+22) = feature1(:,(i-1)*22+1:2:(i-1)*22+22) + homedata;
        awaydata = data;
        awaydata(awaydata>0) = 0;
        feature1(:,(i-1)*22+2:2:(i-1)*22+22) = feature1(:,(i-1)*22+2:2:(i-1)*22+22) + awaydata;
        lastsecond = X(:,(i-1)*second*11+j*11+1:(i-1)*second*11+j*11+11);
    end
end
feature1 = abs(feature1);

% method 1
% lastsecond = X(:,1:11);
% feature2 = zeros(size(X,1), 22);
% lastsecond = zeros(size(X,1), 11);
% for i=0:(1440-1)
%     data = X(:,(i*11)+1:(i*11)+11) - lastsecond;
%     homedata = data;
%     homedata(homedata<0) = 0;
%     feature2(:,1:2:22) = feature2(:,1:2:22) + homedata;
%     awaydata = data;
%     awaydata(awaydata>0) = 0;
%     feature2(:,2:2:22) = feature2(:,2:2:22) + awaydata;
%     lastsecond = X(:,(i*11)+1:(i*11)+11);
% end
% feature2 = abs(feature2);
% 
% for i=1:11
%     sum = feature2(:,(i-1)*2+1) + feature2(:,i*2);
%     feature2(:,(i-1)*2+1) = feature2(:,(i-1)*2+1) ./ sum;
%     feature2(:,i*2) = feature2(:,i*2) ./ sum;
% end
% feature2(isnan(feature2))=0;

feature = [feature1];
% feature = zeros(size(X,1), 22);
% for i = 1:11
%     feature(:,22+(i*2)-1:22+(i*2))=[min(X(:,i:11:15840),[],2),max(X(:,i:11:15840),[],2)];
% end

end

