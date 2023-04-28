function cost = fitness2( T, m, n, Data, Priority)
%find the cost of DNA strand T
scheduling = zeros(m, n, 3);
scheduling(:, :, 1) = T;
scheduling(:, :, 1)
Priority
%set start and finish time for each job operation in scheduling table
%we assume each machine starts at 0
for i= 1: m
    for j= 1: n
%I need to know which operation of this job is presented here(we store it in k)
         
         for k= 1: m
          if (Priority(scheduling(i, j, 1), k) == i)
              break;
          end
         end       
scheduling(i, j, 1)%job num
         i%machine num
         k%th op num 
         
%finish time = timespan + start time
          scheduling(i, j, 3) = Data(scheduling(i, j, 1), k) + scheduling(i, j, 2); 

          if j<n
           scheduling(i, j+1, 2) = scheduling(i, j, 3);
          end
     end
end
%without any priority%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Draw %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Draw(scheduling, m, n);
%%%%%%%%%%%%%%%%%%%%%%%%%%% set priority %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%now each operation should be handle in its priority number j-1 before j

for i= 1:n
    for j= 1:m
        %job i th with j th operation is in machine:Priority(i, j) th
        for k1=1: n
         if (scheduling(Priority(i, j), k1, 1) == i)
             break;
         end
        end
        i%job num
        j%operation
        Priority(i, j)%machine num
        k1%which column in sceduling
     
    if(j< m)            
        for k2= 1: n
         if (scheduling(Priority(i, j+1), k2, 1) == i)
             break;
         end
        end
        i%job num
        j+1%operation
        Priority(i, j+1)%machine num
        k2%which column in sceduling
        
        a= scheduling(Priority(i, j+1), k2, 2);%start time of next operation
        %must be larger than
        b= scheduling(Priority(i, j), k1, 3);%finish time of current operation
       
        if( scheduling(Priority(i, j), k1, 3) > scheduling(Priority(i, j+1), k2, 2) )
             %shift k2 and the rest in the line
             d = b-a;
             d
                                     
              for p=k2 :n
                   
                   scheduling(Priority(i, j+1), p, 2) = scheduling(Priority(i, j+1), p, 2) +d;
                   scheduling(Priority(i, j+1), p, 2)%new start time for next operation
                   scheduling(Priority(i, j+1), p, 3) = scheduling(Priority(i, j+1), p, 3) +d;
                   scheduling(Priority(i, j+1), p, 3)%new finish time for next operation                   
              end
        %{
              for e= n: k2
                
                     %compute the next gap
                     f= scheduling(Priority(i, j+1), e, 3);
                     s= scheduling(Priority(i, j+1), e-1, 2);
                     %next points gap
                     Priority(i, j+1)
                     e
                     Priority(i, j+1)
                     e+1
                     gap = s-f;
                     gap
                     
           
                   if (gap == 0)%distance was 0
                   scheduling(Priority(i, j+1), e, 2) = scheduling(Priority(i, j+1), e, 2) +d;
                   scheduling(Priority(i, j+1), e, 2)%new start time for next operation
                   scheduling(Priority(i, j+1), e, 3) = scheduling(Priority(i, j+1), e, 3) +d;
                   scheduling(Priority(i, j+1), e, 3)%new finish time for next operation
                   
                   scheduling(Priority(i, j+1), e+1, 2) = scheduling(Priority(i, j+1), e+1, 2) +d;  
                   scheduling(Priority(i, j+1), e+1, 2)
                   scheduling(Priority(i, j+1), e+1, 3) = scheduling(Priority(i, j+1), e+1, 3) +d;
                   scheduling(Priority(i, j+1), e+1, 3)
                   end
                    
                   if((gap < d) && (gap ~= 0))%distance was lesser than d
                       
                   scheduling(Priority(i, j+1), e, 2) = scheduling(Priority(i, j+1), e, 2) + (d - gap);
                   scheduling(Priority(i, j+1), e, 2)%new start time for next operation
                   scheduling(Priority(i, j+1), e, 3) = scheduling(Priority(i, j+1), e, 3) + (d - gap);
                   scheduling(Priority(i, j+1), e, 3)%new finish time for next operation
                       
                   scheduling(Priority(i, j+1), e+1, 2) = scheduling(Priority(i, j+1), e+1, 2) +d;  
                   scheduling(Priority(i, j+1), e+1, 3) = scheduling(Priority(i, j+1), e+1, 3) +d;
                   end
                   
                   
                   if(gap > d)%distance was bigger than d
                       %break and dont change any furthur
                       break;           
                   end
                   %}
                                                       
                
        end
          
             
    end
           
    end
 end

%%%%%%%%%%%%%%%%%%%%%%%%%%% Draw %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Draw(scheduling, m, n);

cost =0;

end



