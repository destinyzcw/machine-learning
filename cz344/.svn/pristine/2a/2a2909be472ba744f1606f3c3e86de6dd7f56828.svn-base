function F=forest(x,y,nt)
% function F=forest(x,y,nt)
%
% INPUT:
% x | input vectors dxn
% y | input labels 1xn
%
% OUTPUT:
% F | Forest
%

%% fill in code here
[~,n] = size(x);
F = cell(1, nt);
for i=1:nt
  index = randsample(n,n,replacement = true,[]);
  T=id3tree(x(:,index),y(index));
  F(i) = T;
end;

