function p = LucasKanadeIC(T,I,pini,max_iter,window)


T = ImageDataTypeConversion(T);
I = ImageDataTypeConversion(I);

T = imfilter(T,fspecial('gaussian',[5,5],3),'replicate');

zonex = window(1,1):window(2,1);
zoney = window(1,2):window(3,2);
[maskx,masky] = meshgrid(zoney,zonex);

N = numel(maskx);

% DTx = imfilter(T,[-1 0 1]);
% DTy = imfilter(T,[-1 0 1]');

DTx = imfilter(T,[-1 1],'replicate');
DTy = imfilter(T,[-1 1]','replicate');

DTx = reshape(DTx,N,1);
DTy = reshape(DTy,N,1);
% deltaT = [DTx DTy];


x = [reshape(maskx,N,1) reshape(masky,N,1)];

v0 = zeros(N,1);
v1 = ones(N,1);
dWx = [x(:,1) v0 x(:,2) v0 v1 v0];
dWy = [v0 x(:,1) v0 x(:,2) v0 v1];

J = dWx.*DTx(:,ones(1,6)) + dWy .* DTy(:,ones(1,6));

H = J'*J;
R = H\J';

p = pini;
T = reshape(T,N,1);
I = imfilter(I,fspecial('gaussian',[5 5],3));

for iter = 1:max_iter
    Iw = AffineWarp(I,p,window);
    error = Iw(:) - T;
    deltap = R*error;
%     deltap = H\sumerror; 
    p = m2p(p2m(p)*inv(p2m(deltap)));
%     p = AffineComposition(p,AffineInverse(deltap));
    
    converg = norm(abs(deltap))
%     if converg < 0.1
%        break;
%     end
%     predeltap = deltap;
end
end