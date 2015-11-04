function newp = AffineComposition( p,deltap )
%UPDATE composition of 2 affine warps
%   input: two affine warps
newp = zeros(6,1);
newp(1) = p(1) + deltap(1) + p(1)*deltap(1) + p(3)*deltap(2);
newp(2) = p(2) + deltap(2) + p(2)*deltap(1) + p(4)*deltap(2);
newp(3) = p(3) + deltap(3) + p(1)*deltap(3) + p(3)*deltap(4);
newp(4) = p(4) + deltap(4) + p(2)*deltap(3) + p(4)*deltap(4);
newp(5) = p(5) + deltap(5) + p(1)*deltap(5) + p(3)*deltap(6);
newp(6) = p(6) + deltap(6) + p(2)*deltap(5) + p(4)*deltap(6);

end

