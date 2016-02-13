function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
% function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
%
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% ktype : (linear, rbf, polynomial)
% Cs   : interval of regularization constant that should be tried out
% paras: interval of kernel parameters that should be tried out
% 
% Output:
% bestC: best performing constant C
% bestP: best performing kernel parameter
% bestval: best performing validation error
% allvalerrs: a matrix where allvalerrs(i,j) is the validation error with parameters Cs(i) and paras(j)
%
% Trains an SVM classifier for all possible parameter settings in Cs and paras and identifies the best setting on a
% validation split. 
%
if nargin <6
  paras2 = 1;
end;
%[~, nC] = size(Cs);
%[~, nP] = size(paras);
%allvalerrs = zeros(nC, nP);
%% Split off validation data set
% YOUR CODE


[m,n] = size(xTr);
sigma = 0.05;
a1=xTr .* normrnd(0,sigma,m,n);
a2=xTr .* normrnd(0,sigma,m,n);
a3=xTr .* normrnd(0,sigma,m,n);
xTr1 = xTr + a1;
xTr2 = xTr + a2;
xTr3 = xTr + a3;

num = 1:n / 5;
yVa1=[yTr(:,num), yTr(:,num), yTr(:,num)];
xVa1=[xTr1(:,num), xTr2(:,num), xTr3(:,num)];
yTr1=[yTr, yTr, yTr];
xTr1=[xTr1, xTr2, xTr3];
num = [1:n/5, n+1:n+n/5, 2*n+1:2*n+n/5];
yTr1(:,num)=[];
xTr1(:,num)=[];


%yVa1=yTr(:,num);
%xVa1=xTr(:,num);
%yTr1=yTr;
%xTr1=xTr;
%yTr1(:,num)=[];
%xTr1(:,num)=[];

%[~,n] = size(yTr);
%num = n / 5;
%id = randperm(n, num);
%yVa1=yTr(:,id);
%xVa1=xTr(:,id);
%yTr1=yTr;
%xTr1=xTr;
%yTr1(:,id)=[];
%xTr1(:,id)=[];
%
%id = randperm(n, num);
%yVa2=yTr(:,id);
%xVa2=xTr(:,id);
%yTr2=yTr;
%xTr2=xTr;
%yTr2(:,id)=[];
%xTr2(:,id)=[];
%
%id = randperm(n, num);
%yVa3=yTr(:,id);
%xVa3=xTr(:,id);
%yTr3=yTr;
%xTr3=xTr;
%yTr3(:,id)=[];
%xTr3(:,id)=[];
%
%id = randperm(n, num);
%yVa4=yTr(:,id);
%xVa4=xTr(:,id);
%yTr4=yTr;
%xTr4=xTr;
%yTr4(:,id)=[];
%xTr4(:,id)=[];
%
%id = randperm(n, num);
%yVa5=yTr(:,id);
%xVa5=xTr(:,id);
%yTr5=yTr;
%xTr5=xTr;
%yTr5(:,id)=[];
%xTr5(:,id)=[];


%% Evaluate all parameter settings
% YOUR CODE
bestC = 0;
bestP = 0;
bestval = 1;
valerr = 1;
t=cputime;
while(cputime - t < 1800)
  C=Cs(1)+(Cs(2)-Cs(1))*rand(1);
  P=paras(1)+(paras(2)-paras(1))*rand(1);
  svmclassify=trainsvm(xTr1,yTr1,C,ktype, P);
  valerr = sum(sign(svmclassify(xVa1))~=yVa1(:))./length(yVa1);
  if(valerr < bestval)
    bestval = valerr;
    bestC = C;
    bestP = P;
  end;
end;

t=cputime;
while (cputime - t < 1200)
    C = bestC - 20 + 40 * rand(1);
    P = bestP - 5 + 10 * rand(1);
    svmclassify=trainsvm(xTr1,yTr1,C,ktype, P);
    valerr = sum(sign(svmclassify(xVa1))~=yVa1(:))./length(yVa1);
    if(valerr < bestval)
        bestval = valerr;
        bestC = C;
        bestP = P;
    end;
end;

%for i=1:nC
%  for j=1:nP
%      svmclassify=trainsvm(xTr1,yTr1,Cs(i),ktype, paras(j));
%      allvalerrs(i,j) += sum(sign(svmclassify(xVa1))~=yVa1(:))./length(yVa1);
%      if(allvalerrs(i,j) < bestval)
%        bestval = allvalerrs(i,j);
%        bestC = Cs(i);
%        bestP = paras(j);
%    end;
%  end;
%end;
    

%% Identify best setting
% YOUR CODE
%svmclassify=trainsvm(xTr1,yTr1,bestC,'rbf', bestP);
%allvalerrs(i,j) += sum(sign(svmclassify(xVa1))~=yVa1(:))./length(yVa1);
%svmclassify=trainsvm(xTr2,yTr2,bestC,'rbf', bestP);
%allvalerrs(i,j) += sum(sign(svmclassify(xVa2))~=yVa2(:))./length(yVa2);
%allvalerrs(i,j) /= 2;

