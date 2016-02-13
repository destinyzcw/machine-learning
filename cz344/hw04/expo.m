function [loss,gradient]=expo(w,xTr,yTr,lambda)
[d,n]=size(xTr);

loss=exp(-yTr.*(w'*xTr));
loss=sum(loss) +lambda*w'*w;
tmp=exp(-yTr.*(w'*xTr)).*yTr;
gradient=-xTr*tmp' +2*lambda*w;;