function [ypredict]=evaltree(T,xTe)
% function [ypredict]=evaltree(T,xTe);
%
% input:
% T0  | tree structure
% xTe | Test data (dxn matrix)
%
% output:
%
% ypredict : predictions of labels for xTe
%

%% fill in code here
[~,n] = size(xTe);
ypredict = zeros(1,n);
for j=1:n
  i = 1;
  while 1
    if T(4,i) == 0 && T(5,i) == 0
      ypredict(j) = T(1,i);
      break;
    else
      feature = T(2,i);
      if xTe(feature,j) <= T(3,i)
        if T(4,i) == 0
          ypredict(j) = T(1,i);
          break;
        else
          i = T(4,i);
        end;
      else
        if T(5,i) == 0
          ypredict(j) = T(1,i);
          break;
        else
          i = T(5,i);
        end;
      end;
    end;
  end;
end;
       
