function Io = AffineWarp( I, p, window )
%AFFINEWARP 此处显示有关此函数的摘要
%   window is four points of a rect
% I = ToGray(I);
m = p2m(AffineInverse(p));
% m = inv(p2m(p));
tform = maketform('affine',m');
Io = imtransform(I,tform,'bilinear',...
    'XData',[window(1,1),window(2,1)],...
    'YData',[window(1,2),window(3,2)]);

end

