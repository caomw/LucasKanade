function m = p2m( p )
%P2M 此处显示有关此函数的摘要
%   此处显示详细说明
p(1) = 1 + p(1);
p(4) = 1 + p(4);
m = [reshape(p,2,3);0 0 1];
end

