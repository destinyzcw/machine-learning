function [loss,gradient]=logistic(w,xTr,yTr,lambda)
% function w=logistic(w,xTr,yTr)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% w weight vector (default w=0)
%
% OUTPUTS:
% 
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%
if nargin<4,lambda=0;end;
[d,n]=size(xTr);

loss=log(1+exp(-yTr.*(w'*xTr)));
tmp=exp(-yTr.*(w'*xTr)).*yTr./(1+exp(-yTr.*(w'*xTr)));
gradient=-xTr*tmp' +2*lambda*w;;
loss=sum(loss) +lambda*w'*w;