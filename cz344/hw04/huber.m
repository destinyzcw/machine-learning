function [loss,gradient]=test(w,xTr,yTr,lambda)

[d,n]=size(xTr);

a=0.2;
loss=(w'*xTr-yTr).*(w'*xTr-yTr);
loss=sum(loss) + lambda*(a*(w'*w)+(1-a)*norm(w));
tmp=repmat((w'*xTr-yTr),d,1);
gradient=2*xTr*((w'*xTr-yTr))'+2*lambda*w;


