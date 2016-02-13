function preds=competition(xTr,yTr,xTe);
% function preds=competition(xTr,yTr,xTe);
%
% A classifier that outputs predictions for the data set xTe based on 
% what it has learned from xTr,yTr
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%

% The random classifier is awesome!!! Could you possibly do better?
un=unique(yTr);
[d,n]=size(xTe);
preds=randi(length(un),1,n);

%fill in the code here
preds=knnclassifier(xTr,yTr,xTe,3);
k=1;
[I,D]=findknn(xTr,xTe,k);
preds=yTr(I);
if(n==1)
  preds=preds';
end;
if mode(preds,1)!=(-mode(-preds,1))
    preds=knnclassifier(xTr,yTr,xTe,k-1);
end
%D=1./D;
%[a,b]=hist(preds,unique(preds));
%b=b.*D;
%[~,num]=max(b);
%preds=a(num);
preds=sum(preds,1)/k;