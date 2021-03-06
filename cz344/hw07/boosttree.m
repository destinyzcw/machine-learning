function BDT=boosttree(x,y,nt,maxdepth)
% function BDT=boosttree(x,y,nt,maxdepth)
%
% Learns a boosted decision tree on data x with labels y.
% It performs at most nt boosting iterations. Each decision tree has maximum depth "maxdepth".
%
% INPUT:
% x  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees (default = 100)
% maxdepth | depth of each tree (default = 3)
%
% OUTPUT:
% BDT | Boosted DTree
%


%% fill in code here

if nargin < 3
  nt = 100;
  maxdepth = 3;
end;

BDT = cell(2,nt);
[~,n] = size(y);
weights = ones(1, n);
stepsize = 1;
for i=1:nt
  T=id3tree(x,y,maxdepth,weights);
  BDT(1,i) = T;
  BDT(2,i) = stepsize;
  ypredict = evaltree(T,x);
  err = sum(abs(ypredict - y)) /2 /n;
  stepsize = log((1-err)/err)/2;
  weights = weights .* ((ypredict==y) * exp(-stepsize) + (ypredict ~= y) * exp(stepsize));
end;
  
  

