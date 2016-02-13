function preds=evalboost(BDT,xTe)
% function preds=evalboost(BDT,xTe);
%
% Evaluates a boosted decision tree on a test set xTe.
%
% input:
% BDT | Boosted Decision Trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here

[~,n] = size(BDT);
count = 0;
[~,num] = size(xTe);
pred = zeros(1,num);
for i=1:n
  T = cell2mat(BDT(1,i));
  ypredict=evaltree(T,xTe);
  weight = cell2mat(BDT(2,i));
  pred += weight * ypredict;
  count += weight;
end;
preds = sign(pred / count - 1) + 1;
