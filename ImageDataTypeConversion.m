function Io = ImageDataTypeConversion( I )
%IMAGEDATATYPECONVERSION �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
Io = ToGray(I);
Io = im2double(Io);

end

