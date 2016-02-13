function svmclassify=autosvm(xTr,yTr)
%	function svmclassify=autosvm(xTr,yTr)
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% 
% Output:
% svmclassify : a classifier (scmclassify(xTe) returns the predictions on xTe)
%
%
% Performs cross validation to train an SVM with optimal hyper-parameters on xTr,yTr
%
kernel = 'rbf';
%disp('Performing cross validation ...');
%[bestC,bestP]=crossvalidate(xTr,yTr,kernel,[50,400],[0,40]);
disp('Training SVM ...');
svmclassify=trainsvm(xTr,yTr,128,kernel,1);

