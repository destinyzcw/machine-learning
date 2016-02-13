function preds=evalforest(F,xTe)
% function preds=evalforest(F,xTe);
%
% Evaluates a random forest on a test set xTe.
%
% input:
% F   | Forest of decision trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here
[~,n] = size(F);
[~,num] = size(xTe);
ypredict = zeros(1,num);
pred = zeros(1,num);
for i=1:n
  T = cell2mat(F(i));
  ypredict = evaltree(T, xTe);
  pred = [pred;ypredict];
end;
preds = mode(pred);
  
  

