function Tube = merge( T1,T2 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
d1=size(T1);
d1=d1(1,2);
d2=size(T2);
d2=d2(1,2);
d3=d1 + d2;
%d1
%d2
%d3
Tube = cell(1, d3);

for i = 1 : d1
 Tube{i} = T1{i};
end

for i = 1 : d2
 Tube{i+d1} = T2{i};
end


end

