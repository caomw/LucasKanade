function Io = ToGray( I )
%TOGRAY �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if(size(I,3)>1)
    Io = rgb2gray(I);
else
Io = I;
end

end

