function Tube = Appeand( T, X )
%Add X to the end of every DNA_Strands in tube T

d1= size(T);
d2= size(T{1});
index = d2(1,2);

for i= 1: d1(1,2)
 T{i}(index+1)= X;
% T{i}(index+1)
end

Tube = T;
end

