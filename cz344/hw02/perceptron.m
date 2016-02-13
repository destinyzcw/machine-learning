function w=perceptron(x,y);
% function w=perceptron(x,y);
%
% Implementation of a Perceptron classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
%

[d,n]=size(x);
w=zeros(d,1);


%% fill in code here
for i=1:100
t=zeros(n,1);
  for j=1:n
  if w==perceptronUpdate(x(:,j),y(j),w)
    t(j)=1;
    else
    w=perceptronUpdate(x(:,j),y(j),w);
    end
  end
  if sum(t)==n
  break;
  end;
end