clear;
clc;
rgb = imread('affine_prince.jpg');
img = ImageDataTypeConversion(rgb);

sc = 0.3; img = imresize(img,sc);


pts = sc*[771, 1587, 771, 1587;
    885, 885, 1503, 1503]';
% window = [1,30,1,30;
%     1,1,30,30]';
window = [0,29,0,29;
    0,0,29,29]';

p = AffinePara4Points(window,pts);

T_0 = AffineWarp(img,p,window);

% figure,imshow(T_0)


ptrue = p

dp = normrnd(0,0.3,6,1); 
% dp = [0.26 -0.62 0.26 -0.36 -18.15 -2.32]';
pini = p + dp

newp = LucasKanade(T_0,img,pini,30,window)
% newp = LucasKanadeIC(T_0,img,pini,30,window)
