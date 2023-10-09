function Y = Normalize(X)
% Y = cvtNormalize(X)
% input
%  X: column vectors
% output
%  Y: normalized vectors
A = sum(X.^2).^0.5;
[s, I] = find(A==0);
A(I) = 1;
Y = X./repmat(A,size(X,1),1);
