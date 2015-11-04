function p = LucasKanade( T,I,pini,max_iter,window )
%LUCASKANADE 此处显示有关此函数的摘要
%   此处显示详细说明
% T = ImageDataTypeConversion(T);
% I = ImageDataTypeConversion(I);

if isinteger(I)
   I = im2double(I); 
end

% T = imfilter(T,fspecial('gaussian',[5,5],3),'replicate');

zonex = window(1,1):window(2,1);
zoney = window(1,2):window(3,2);

[maskx,masky] = meshgrid(zoney,zonex);

N = numel(maskx);

I = imfilter(I,fspecial('gaussian',[5,5],3));

DIx = imfilter(I,[-1 1]);
DIy = imfilter(I,[-1 1]');


x = [maskx(:) masky(:)];

p = pini;
T = reshape(T,N,1);
v0 = zeros(N,1);
v1 = ones(N,1);
dWx = [x(:,1) v0 x(:,2) v0 v1 v0];
dWy = [v0 x(:,1) v0 x(:,2) v0 v1];

for iter = 1:max_iter
    %step 1.
    Iw = AffineWarp(I,p,window);
    %step 2.
    error = T - Iw(:);
    %step 3.
    DIxw = AffineWarp(DIx,p,window);
    DIyw = AffineWarp(DIy,p,window);
    DIxw = DIxw(:); 
    DIyw = DIyw(:);
    
    %step 4.

    
    %step 5.
    J = dWx .* DIxw(:,ones(1,6)) + dWy .* DIyw(:,ones(1,6));
    %step 6.
%     H = J'*J;
    %step 7.
%     deltap = H\J'*error;
%     norm(error)a
    deltap = J\error;
    %step 8.
    p = p + deltap;
    converg = norm(abs(deltap))
    if converg < 0.01
        break;
    end
end


end

