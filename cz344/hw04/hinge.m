function [loss,gradient,preds]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);

I=ones(1,n);
loss=I-yTr.*(w'*xTr);
tmp=sign(loss);
tmp=(tmp+ones(1,n))/2;
loss=sum(loss.*tmp)+lambda*w'*w;
gradient=-xTr*(yTr.*tmp)';
gradient=gradient+2*lambda*w;
