function [Tube1, Tube2] = Extract( Tube, DNA_Strand )
%return all the strands in tube T which have the X as a substring
num1=1;
num2=1;

d1=size(Tube);

Tube1 = cell(1, 1);
Tube2 = cell(1, 1);


for i= 1:d1(1,2) %for all strands in T
  
     if Tube{i}== X
       Tube1{num1}=Tube{i}; %save the strand which had X as substring in Tube1
       num1 = num1 + 1;
     else
       Tube2{num2}=Tube{i}; %save the strand which didn't have X as substring in Tube2
       num2 = num2 + 1;
     end
    
end


end

