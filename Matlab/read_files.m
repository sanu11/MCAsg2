
function finalData = Preprocess(folder)
filesPath = folder+'\*.csv';
dinfo = dir(filesPath);

finalData = [];
for K = 1:length(dinfo)
    
     % read file  
    fileName = dinfo(K).name;
    fileNameArr = strsplit(fileName,'_');
    
    
    filePath = ""+folder+fileName;
    opts = detectImportOptions(filePath);
    table = readtable(filePath,opts);
    rawData = table(:,3:35);
   
    % extract required columns
    scoreCol = regexp( rawData.Properties.VariableNames, '^.+_score$' );
    X = rawData( :, cellfun( @isempty, scoreCol ) );
    
    % add columnLabel and append to mainData
    classlabel ={fileNameArr{1,2}};
    [row col] = size(X);
    Y = repmat(classlabel,row,1);
    Y = cell2table(Y);
    data = [X Y];
    finalData = [finalData;data];
 
end

end
