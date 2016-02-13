function [posprob,negprob] = naivebayesPXY(x,y)
% function [posprob,negprob] = naivebayesPXY(x,y);
%
% Computation of P(X|Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% posprob: probability vector of p(x|y=1) (dx1)
% negprob: probability vector of p(x|y=-1) (dx1)
%

% add one all-ones positive and negative example
[d,n]=size(x);
x=[x ones(d,2)];
y=[y -1 1];

[d,n] = size(x);
%% fill in code here
Y1=(y+ones(1,n))/2;
Y1=repmat(Y1,d,1);
X1=x.*Y1;
num1=sum(X1(:)==1);
posprob=sum(X1,2)/num1;

Y2=(-y+ones(1,n))/2;
Y2=repmat(Y2,d,1);
X2=x.*Y2;
num2=sum(X2(:)==1);
negprob=sum(X2,2)/num2;
  