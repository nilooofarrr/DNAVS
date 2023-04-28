function a = Draw( scheduling, m, n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

str = 'machine';
p=15;

for j= 0:m-1   
for i = 0:n-1
text('position', [p-11 1.2*p + 10*j+2], 'string', str);   
text('position', [p-2 1.2*p + 10*j+2], 'string', j+1); 
rectangle('position',[p+15*i 1.2*p + 10*j 13 4]);
axis([0 180 0 100]);
text('position', [p+2+15*i 1.2*p-2+ 10*j], 'string', scheduling(j+1, i+1, 2));
text('position', [p+9+15*i 1.2*p-2+ 10*j], 'string', scheduling(j+1, i+1, 3));
text('position', [p+4.5+15*i 1.2*p+1.5+ 10*j], 'string', scheduling(j+1, i+1, 1));
end
end

a=0;
end

