function [cost, StartTimes] = fitness3( T, m, n, Data, Priority)
%T is an m*n matrix and I need to create Sol based on it
%Data is n*m
Sol = zeros(m, n, 2);


Sol(:, :, 1) = T;

for i=1:m
    for j=1:n
    
        for p= 1:m
            if(Priority(Sol(i, j, 1), p) ==  i)
                Sol(i, j, 2) = p;
                break;
            end       
        end

    end
end


S = zeros(n, m);
F = zeros(n, m);
Timespan = Data;%with n*m dimension
Machine_Time = zeros(1, m);% you could easily set machine start time instead of zeros
check = zeros(n, m);
check_num = 0;

c = clock;
seconds = c(6);

while(check_num == 0)
    
   for  i= 1:m 
       for   j=1:n 
        %does the previous operation done? or Does it the first operation?
          op= Sol(i, j, 2); 
          job= Sol(i, j, 1);
          
         if(check(job, op)==0) %if this operation hadnt done by any machine
           if((op ~= 1) && (check(job, op-1)==0))
               break;
           end
           if(op == 1)

                S(job, op)= Machine_Time(1, i);
                F(job, op)= S(job, op) + Timespan(job, op);
                Machine_Time(1, i)= F(job, op);

                check(job, op)=1;         
           
           elseif(F(job, op-1)~=0)
               
             if(F(job, op-1) > Machine_Time(1, i))                  
                S(job, op)= F(job, op-1);
                F(job, op)= S(job, op) + Timespan(job, op);
                Machine_Time(1, i)= F(job, op);
                check(job, op)=1;                  
               else
                S(job, op)= Machine_Time(1, i);               
                F(job, op)= S(job, op) + Timespan(job, op);                 
                Machine_Time(1, i)= F(job, op);
                check(job, op)=1;    
     
             end 
           end
         end        
        end
   end


check_num = 1;
    for row=1:n
        for col=1:m
            check_num = check_num * check(row, col);
        end
    end
% ------------------------------------------------------------------------------ 

    c2 = clock;
    timedifference=abs (c2(6)-seconds);
    if(timedifference >= 2)
        cost = 100000000000000000;
        return;
    end

 % -----------------------------------------------------------------------------  
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PRINNT
%{
StartTimes = zeros(m, n);
        str = 'machine';
        p=15;

        for j= 0:m-1   
        for i = 0:n-1
        text('position', [p-11 1.2*p + 10*j+2], 'string', str);   
        text('position', [p-2 1.2*p + 10*j+2], 'string', j+1); 
        rectangle('position',[p+15*i 1.2*p + 10*j 13 4]);
        axis([0 180 0 100]);
  StartTimes(j+1, i+1) = S(Sol(j+1, i+1, 1), Sol(j+1, i+1, 2));

        text('position', [p+2+15*i 1.2*p-2+ 10*j], 'string', S(Sol(j+1, i+1, 1), Sol(j+1, i+1, 2)));
        text('position', [p+9+15*i 1.2*p-2+ 10*j], 'string', F(Sol(j+1, i+1, 1), Sol(j+1, i+1, 2)));
        text('position', [p+4.5+15*i 1.2*p+1.5+ 10*j], 'string', Sol(j+1, i+1, 1));
        end
        end

%}
        cost = max(Machine_Time);


end


