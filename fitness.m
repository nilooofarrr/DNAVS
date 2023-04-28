function  cost = fitness( T, m, n, Data) 
%T is DNA strand with size n
%fitness function calculates the last finish time of the last job in m machines
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DNADNADNADNA
%% Create a Tube with M copies of the T then save max as last finished time
T0 = cell(1,1);
T0{1} = T;
Tube = amplify(T0, m);
%Tube is a cell of cell of arrays
% Appeand(T,X); Add X which is lastfinish cost of ith machine to ith Strand
% in T (T is a Tube)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%VERSION2  
%In the second version of job shop the i th job should be done before the
%i+1 th job
%Start_time_Table =zeros(n);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%VERSION2  
for i= 1:m
Time_DNA_T=0;

  for j = 1:n
   if(Tube{i}{1}(j) == i)    %if jth job were assigned to the ith machine
       
        Time_DNA_T =  Time_DNA_T + Data(i,j);
      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%VERSION2 
  end
  end
 Tube{i} = Appeand( Tube{i}, Time_DNA_T );
end

%pick the tube which contains largest DNA strand or the one with biggest last_finish_time
arr = zeros(1,m);
for i=1:m
 arr(1,i) = Tube{i}{1}(n+1);
end
 
cost = max(arr);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DNADNADNADNA

end

