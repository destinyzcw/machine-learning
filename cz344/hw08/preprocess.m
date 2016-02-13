function [xTr,xTe,u,m]=preprocess(xTr,xTe);
% function [xTr,xTe,u,m]=preprocess(xTr,xTe);
%
% Preproces the data to make the training features have zero-mean and
% standard-deviation 1
%
% output:
% xTr - pre-processed training data 
% xTe - pre-processed testing data
% 
% u,m - any other data should be pre-processed by x-> u*(x-m)
%
[~,n] = size(xTr);
[~,n1] = size(xTe);

m = sum(xTr, 2) / n;
xTr -= repmat(m, 1, n);

m = sum(xTr, 2) / n;
u = diag(1 ./ sqrt(sum(xTr .* xTr, 2) / (n-1)));
xTr = u * xTr;

xTe = u * (xTe - repmat(m, 1, n1));

