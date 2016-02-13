function T=prunetree(T,xTe,y)
% function T=prunetree(T,xTe,y)
%
% Prunes a tree to minimal size such that performance on data xTe,y does not
% suffer.
%
% Input:
% T = tree
% xTe = validation data x (dxn matrix)
% y = labels (1xn matrix)
%
% Output:
% T = pruned tree
%

%% fill in code here

[~,n] = size(xTe);
for j=1:n
  i=1;
  while 1
    if T(2,i) == 0
      break;
    end;
    if xTe(T(2,i),j) <= T(3,i)
      if T(4,i) == 0
        break;
      else
        i = T(4,i);
      end;
    else
      if T(5,i) == 0
        break;
      else
        i = T(5,i);
      end;
    end;
  end;
  if T(1,i) != y(j)
    index = T(6,i);
    if(index != 0)
      if T(4,index) == i
        T(4,index) = 0;
      else
        T(5,index) = 0;
      end;
    end;
  end;
end;
    