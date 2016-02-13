function output=analyze(kind,truth,preds)	
% function output=analyze(kind,truth,preds)		
%
% Analyses the accuracy of a prediction
% Input:
% kind='acc' classification error
% kind='abs' absolute loss
% (other values of 'kind' will follow later)
% 

switch kind
	case 'abs'
		% compute the absolute difference between truth and predictions
		%fill in the code here
		L=abs(truth-preds);
    output=sum(sum(L))/numel(L);
	case 'acc' 
		%% fill in code here
		L=abs(truth-preds);
    output=1-sum(L(:)~=0)/numel(L);
end;

