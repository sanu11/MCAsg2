weights = model.Beta
bias = model.Bias
%write model to file
fid= fopen('D:\MC\Asg2\Android app\Matlab\model.csv','w+');
fprint(fid,weights);
dlmwrite('D:\MC\Asg2\Android app\Matlab\model.csv',bias,'-append');

%writing test data to file
writeData = dataTest(:,1:22)
writeData = [writeData dataTest(:,24)]
csvwrite('D:\MC\Asg2\Android app\Matlab\test.csv',table2array(writeData));