function [ FSdata , column_names_new , selected_features, print ] = FS_mRMR( data , labels , column_names, threshold )
%mRMR for Feature Selection
%Usage:
%   [FSdata,column_names_new,selected_features,print] = FS_mRMR(data,labels,column_names,threshold)
%Input:
%   data (events x features)
%   labels (events x 1)
%   column_names (1 x colnum cell)
%   threshold (desired number of features)
%Output:
%   FSdata (data matrix with selected features)
%   column_names_new (cell with selected features' names)
%   selected_features (vector with selected features' index)
%   print (string for interface text feedback)

disp('|---mRMR---|');

selected_features = sort(mrmr_mid_d(data,labels,threshold));

FSdata = data(:,selected_features);
column_names_new = column_names(selected_features);

T = table(num2cell(selected_features'),cellstr(column_names_new'),'VariableNames',{'Column_index' 'Feature'});
disp(T);
selected_features = selected_features';        
disp('mRMR completed.')

print = sprintf('mRMR completed..\n%d Features selected.',length(selected_features));

end