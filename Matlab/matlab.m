addpath("D:\MC\Asg2\")
which 'Preprocess'
finalData = Preprocess("D:\MC\Asg2\about_father\about_father\");
% change about to 0
disp("data received");
[row col]=size(finalData);
finalData = [finalData array2table(repmat(0,row,1))];
for i = 1:1:row
if(string(finalData{i,23}) =='About')
    finalData{i,24}=0;
end
if(string(finalData{i,23})== 'Father')
    finalData{i,24}=1;
end
end
disp("data updated");
% shuffle data
shuffledData = finalData(randperm(size(finalData,1)),:);

% Cross varidation (train: 70%, test: 30%)
cv = cvpartition(size(shuffledData,1),'HoldOut',0.3);
idx = cv.test;
% Separate to training and test data
dataTrain = shuffledData(~idx,:);
dataTest  = shuffledData(idx,:);

% 80-20 loss around 36
% 70-30 loss around 15
% 100 training loss 40
model=fitcsvm(dataTrain(:,1:22),dataTrain(:,24))
