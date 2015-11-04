function Io = ImageDataTypeConversion( I )
%IMAGEDATATYPECONVERSION 此处显示有关此函数的摘要
%   此处显示详细说明
Io = ToGray(I);
Io = im2double(Io);

end

