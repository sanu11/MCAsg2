count=0
for i = 1:1:12357
testX=dataTest(i,1:22);
test = table2array(testX);
test = test';
prediction = dot(test,weights)+bias;
if(prediction <0 && dataTest{i,24}==0)
count=count+1;
elseif(prediction>=0 && dataTest{i,24}==1)
        count=count+1;
end
end
testAcc = (count/12357)