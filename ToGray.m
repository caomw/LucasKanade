function Io = ToGray( I )
%TOGRAY 此处显示有关此函数的摘要
%   此处显示详细说明
if(size(I,3)>1)
    Io = rgb2gray(I);
else
Io = I;
end

end

