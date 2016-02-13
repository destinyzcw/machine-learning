function ybar=computeybar(xTe)
% function [ybar]=ybar(xTe);
% 
% computes the expected label 'ybar' for a set of inputs x
% generated from two standard Normal distributions (one offset by OFFSET in
% both dimensions.)
%
% INPUT:
% xTe | a 2xn matrix of column input vectors
% 
% OUTPUT:
% ybar | a 1xn vector of the expected label ybare(x)
%

global OFFSET;

[~,n]=size(xTe);
ybar=zeros(1,n);
% Feel free to use the following function to compute p(x|y)
normpdf=@(x,mu,sigma)   exp(-0.5 * ((x - mu)./sigma).^2) ./ (sqrt(2*pi) .* sigma);

u1 = [0;0];
u2 = [OFFSET;OFFSET];
pxy1 = prod(normpdf(xTe, u1, 1), 1);
pxy2 = prod(normpdf(xTe, u2, 1), 1);
py1x = pxy1 ./ (pxy1 + pxy2);
py2x = pxy2 ./ (pxy1 + pxy2);
ybar = 1 * py1x + 2 * py2x;