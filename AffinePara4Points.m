function p = AffinePara4Points( srcPoints, dstPoints )
%AFFINEMATRIX4POINTS 此处显示有关此函数的摘要
%   此处显示详细说明
u = srcPoints(:,1);
v = srcPoints(:,2);
N = size(srcPoints,1);
v0 = zeros(N,1);
v1 = ones(N,1);
A = [u v0 v v0 v1 v0;
    v0 u v0 v v0 v1];

% p = (A'*A)\A'*(dstPoints(:) - srcPoints(:));
p = A\(dstPoints(:) - srcPoints(:));
end



