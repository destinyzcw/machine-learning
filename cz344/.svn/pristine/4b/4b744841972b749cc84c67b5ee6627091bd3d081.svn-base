function T=id3tree(xTr,yTr,maxdepth,weights)
% function T=id3tree(xTr,yTr,maxdepth,weights)
%
% The maximum tree depth is defined by "maxdepth" (maxdepth=2 means one split).
% Each example can be weighted with "weights".
%
% Builds an id3 tree
%
% Input:
% xTr | dxn input matrix with n column-vectors of dimensionality d
% yTr | 1xn input matrix
% maxdepth = maximum tree depth
% weights = 1xn vector where weights(i) is the weight of example i
%
% Output:
% T = decision tree
%

%% fill in code here
[~,n] = size(yTr);
if nargin < 3
  maxdepth = 1000000;
  weights = ones(1,n);
end;
if nargin < 4
  weights = ones(1,n);
end;
  if(maxdepth > 10)
    T = zeros(6, 100);
    data = cell(3, 100);
  else
    T = zeros(6, 2^maxdepth);
    data = cell(3, 2^maxdepth);
  end
  head = 1;
  tail = 1;
  depth = 1;
  preroot = 0;
  data(1,1) = xTr;
  data(2,1) = yTr;
  data(3,1) = weights;
  
  while head <= tail
    if head == 1
      parent = 0;
    else 
      parent = head;
    end;
    depth = 1;
    index = head;
    while T(6,index) != 0
      depth++;
      index = T(6,index);
    end;
    x = cell2mat(data(1,head));
    y = cell2mat(data(2,head));
    w = cell2mat(data(3,head));
    [~,n] = size(x);
    if sum(y)/n == y(1) || sum(x,2)/n == x(:,1) || depth == maxdepth
      T(:,head) = [mode(y), 0, 0, 0, 0, T(6,head)]';
      head++;
    else
      [feature,cut,Hbest]=entropysplit(x,y,w);
%      [xTr1, yTr1, weights1, xTr2, yTr2, weights2] = seperate(x, y, feature, cut, w);

      index1 = find(x(feature,:)<=cut);
      index2 = find(x(feature,:)>cut);
      xTr1 = x(:,index1);
      yTr1 = y(index1);
      weights1 = w(index1);
      xTr2 = x(:,index2);
      yTr2 = y(index2);
      weights2 = w(index2);
      
      T(:,head) = [mode(y), feature, cut, tail+1, tail+2, T(6,head)]';
      T(6,tail+1) = head;
      T(6,tail+2) = head;
      head++;
      data(1,tail+1) = xTr1;
      data(2,tail+1) = yTr1;
      data(3,tail+1) = weights1;
      data(1,tail+2) = xTr2;
      data(2,tail+2) = yTr2;
      data(3,tail+2) = weights2;
      tail += 2;
    end;
  end;
  T(:,find(sum(abs(T),1)==0))=[];


  
function [xTr1, yTr1, weights1, xTr2, yTr2, weights2] = seperate(xTr, yTr, feature, cut, weights)
  tmp = [xTr; yTr; weights];
  tmp = sortrows(tmp',feature)';
  [d, n] = size(xTr);
  for i=1:n
    if tmp(feature, i) <= cut && tmp(feature, i+1) > cut
      break;
    end;
  end;
  xTr1 = tmp(1:d, 1:i);
  yTr1 = tmp(d+1, 1:i);
  weights1 = tmp(d+2, 1:i);
  xTr2 = tmp(1:d, i+1:n);
  yTr2 = tmp(d+1, i+1:n);
  weights2 = tmp(d+2, i+1:n);
 

