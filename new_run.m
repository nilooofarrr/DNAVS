% name: Seyedeh Fatemeh Razavi
% subject: paper (VSA)
% note: implemented with Matlab R2010b in Intel Core2 Duo CPU (2.10 GHz) with 4 GB internal memory.

clc;
clear all;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Original DAta %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Data = [5,3,4,6,2;2,8,5,3,3];
m=2;
n=5;
%}
run_number = 3;
%{
Be_main=zeros(1,run_number);
It_main=zeros(1,run_number);

Be_move=zeros(1,run_number);
It_move=zeros(1,run_number);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Data Generator %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
m = randi([1,30]); %number of machines
n = randi([10,20]); %number of jobs
Data = zeros(m, n); %is a m*n matrix

for i = 1 : m
 for j = 1 : n
   Data(i, j)= randi([1,20]); 
 end
end
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Article Data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% ta01 %%%%%%%%%% m * n
% !!!!! Data = [6,4,1,5,7,5,12,11,10,6,4,2,5,8,10;94,74,4,73,78,29,18,32,85,5,90,47,65,28,57;12,5,8,2,8,3,3,5,11,11,7,14,8,14,8;66,31,82,23,23,61,75,52,30,59,27,43,62,21,16;4,7,9,9,6,12,7,0,6,9,13,0,10,4,12;10,88,40,30,21,88,20,9,96,30,1,75,97,51,42;7,14,12,6,10,13,8,7,14,2,0,12,2,13,6;53,51,86,30,60,70,4,49,91,60,8,8,20,75,34;3,13,6,10,4,11,14,12,0,8,5,6,3,5,4;26,57,50,53,36,16,91,61,13,41,91,51,31,17,37;2,8,11,0,9,4,6,13,1,0,12,10,6,6,1;15,78,54,94,29,31,68,35,87,17,80,3,33,89,26;10,11,13,13,2,14,1,14,2,13,6,7,9,9,13;65,8,21,58,95,65,19,99,82,66,89,84,33,59,68;11,9,5,4,14,7,11,1,5,3,8,5,0,1,14;82,7,6,93,99,83,54,62,83,89,49,34,77,56,73;8,6,0,7,12,2,4,2,12,10,14,8,13,12,11;10,91,54,32,79,78,85,6,78,78,32,28,50,63,5;14,10,2,14,5,1,5,8,4,7,10,9,4,7,0;27,79,68,91,76,26,73,62,56,88,28,60,80,18,8;9,0,7,11,1,10,2,4,8,1,3,13,1,11,7;93,18,82,30,93,50,43,7,85,69,90,69,48,17,12;13,3,10,8,13,0,10,3,7,12,1,1,11,10,3;92,51,20,56,42,87,24,80,8,45,93,45,90,30,87;5,12,4,12,11,9,0,9,9,14,11,3,12,3,2;96,18,39,27,52,62,37,3,66,82,6,67,75,16,83;0,1,3,1,0,6,13,6,13,4,9,11,7,2,9;70,99,35,92,42,14,87,57,88,6,35,58,96,7,20;1,2,14,3,3,8,9,10,3,5,2,4,14,0,5;83,33,68,9,96,30,66,7,15,13,73,87,44,35,97];
%m= 30;
%n= 15;
%%%%%% la01 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Data = [ 21, 53, 95, 55, 34;
 21, 52, 16, 26, 71;
 39, 98, 42, 31, 12;
 77, 55, 79, 66, 77;
 83, 34, 64, 19, 37;
 54, 43, 79, 92, 62;
 69, 77, 87, 87, 93;
 38, 60, 41, 24, 83;
 17, 49, 25, 44, 98;
 77, 79, 43, 75, 96;
];

Priority = [1,0,4,3,2;
0,3,4,2,1;
3,4,1,2,0;
1,0,4,2,3;
0,3,2,1,4;
1,2,4,0,3;
3,4,1,2,0;
2,0,1,3,4;
3,1,4,0,2;
4,3,2,1,0;
];

Priority = Priority+1;
    
m= 5;
n= 10;


%{
T = [5, 2, 4, 8, 1, 7, 9, 6, 3, 10;
4, 6, 1, 7, 3, 9, 8, 5, 2, 10;
8, 6, 5, 7, 4, 2, 10, 3, 9, 1;
7, 3, 9, 5, 2 ,10, 4, 8, 1, 6;
10, 7, 3, 4, 2, 9, 6, 1, 5, 8;];
%}

%%%%%% La02 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
Data = [ 20,  87,  31,  76,  17;
25,  32,  24,  18,  81;
72,  23,  28,  58,  99;
86,  76,  97,  45,  90;
27,  42,  48,  17,  46;
67,  98,  48,  27,  62;
28,  12,  19,  80,  50;
63,  94,  98,  50,  80;
14,  75,  50,  41,  55;
72,  18,  37,  79,  61;
];

Priority =[0,  3,  1,  4,  2; 
4,  2,  0,  1,  3; 
1,  2,  4,  0,  3; 
2,  1,  4,  0,  3; 
4,  0,  3,  2,  1; 
1,  0,  4,  3,  2; 
4,  1,  3,  0,  2; 
1,  0,  2,  3,  4; 
4,  0,  2,  1,  3; 
4,  2,  1,  3,  0; 
];

Priority = Priority+1;

    
m= 5;
n= 10;
%}


%{
T=[1, 5, 2, 9, 3, 8, 6, 4, 7, 10;
3, 8, 7, 2, 6, 4, 10, 1, 9, 5;
2, 3, 4, 10, 5, 9, 8, 6, 7, 1;
1, 5, 7, 2, 3, 10, 9, 6, 8, 4;
5, 2, 7, 9, 3, 10, 4, 6, 1, 8;];
%}



%%%%% generate a feasible solution based on 5-function theorem
%{
table = zeros(m, m*n);

column = zeros(1, m);

for i=1:n
    for j=1:m
        if (j==1)
          column(j)= randi([1, m*n-m]);
          table(Priority(i, j), column(j)) = i;
          i, j
          'row'
          Priority(i, j)
          'col'
          column(j)

        else
          column(j)= randi([column(j-1)+1, m*n-(m-j)]);   
          table(Priority(i, j), column(j)) = i;
          i, j
          'row'
          Priority(i, j)
          'col'
          column(j)
          
        end
    end  
end

table

%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


T = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10;
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10;
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10;
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10;
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10;];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%CONVERT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
ready_for_sort= zeros(2, m, n);
%Capsulate T and its start time

ready_for_sort(1, :, :)= T;
ready_for_sort(2, :, :)= start_times;
%s=convert_matrix_to_vector( s, Data, Priority, n, m )

V= convert_matrix_to_vector( T, Data, Priority, n, m )
%T2 =convert_vector_to_matrix( V, Data, Priority, n, m );
[c, start_times]=fitness3(T, m, n, Data, Priority);

%#####################################################
%%%%%%%%%%%%%     s=sort(s);    %%%%%%%%%%%%%%%%%%%%%

%% PUTTING AN VECTOR OF NUMBERS IN AN ASCENDING ORDER?
% Language : Matlab 2007a
% Authors : Autar Kaw
% Last Revised : November 8, 2009
% Abstract: This program shows you how to put a vector
% of numbers in an ascending order using the bubble sort method
clc
clear all
disp('Bubble sorti times')
disp('  ')
%% INPUTS
% The vector of numbers
disp ('INPUTS')
disp('Input the vector of numbers')
disp(ready_for_sort)
%% SOLUTION
% Number of entries, n
n=length(ready_for_sort);
% making (n-1) passes
for j=1:1:n-1
    % comparing each number with the next and swapping
    for i=1:1:n-1
    if ready_for_sort(i)>ready_for_sort(i+1);
        % temp is a variable where the numbers are kept
        % temporarily for the switch
        temp=ready_for_sort(i);
        ready_for_sort(i)=ready_for_sort(i+1);
        ready_for_sort(i+1)=temp;
    end
    end
end

%% OUTPUT
disp('  ')
disp ('OUTPUT')
disp ('The ascending matrix is')
disp(ready_for_sort)

%#####################################################
T2=convert_vector_to_matrix( s, Data, Priority, n, m );

%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% define parameter%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for run=1:1:run_number
display(['run = ',num2str(run)]);


size_neighbor = 1000   % for main and secondary vortex
max_iteration = 1000

%for diagram%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
array_iteration = zeros(1, max_iteration);
array_fitness3 = zeros(1, max_iteration);
number = 1;

D = m*n;
U = m*n;
L = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Define The start point %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% First Strand %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DNADNADNA

T_vector= convert_matrix_to_vector( T, Data, Priority, n, m );
%T2= convert_vector_to_matrix( V, Data, Priority, n, m );

first_DNA_stand=T_vector;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%initializing the radius of vortex%%%%%%%%%%%%%%DNADNADNA
r = m*n;

iter=1; % iteration count
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DNADNADNA
Current_Strand = first_DNA_stand;
%c = clock;
T_vector= convert_matrix_to_vector( T, Data, Priority, n, m );
T2= convert_vector_to_matrix( T_vector, Data, Priority, n, m );
Current_Strand_cost= fitness3( T2, m, n, Data, Priority );
%c2= clock;

%abs(c2(6)-c(6))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DNADNADNA


while (iter <= max_iteration)
    
%%%%%%%%%%%%%%%%%% Generate Matrix neighbors for Current node %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% by Gaussian function in a circular neighborhood with R raduis among a discrete data set
% generate 50(= Size_neighbor) number between 1 and 5(=n) in standard
% deviation distribution

C = r.*randn(size_neighbor,1);
Distance_matrix1= bsxfun(@plus, C, r); 

    Distance_matrix1( Distance_matrix1 < 1 ) = 1 + rand*( m*n - 1 );                                      
    Distance_matrix1( Distance_matrix1 > (m*n+1) ) = 1 + rand*( ( m*n + 1 ) - 1 );

Distance_matrix1 = floor(Distance_matrix1);

Distance_matrix1 = abs( bsxfun(@minus, Distance_matrix1, m+1) );
%Distance_matrix1

%%%%%%%%%%%%%%% Generate the Matrix neighbor for current node based on distance matrix %%%%%%%%%%%%
neighbor = zeros(size_neighbor, m*n);


for i=1:size_neighbor
  neighbor(i, :) = neighbor2( Current_Strand, Distance_matrix1(i), m, n );
end
%Check neigbor
%Current_Strand
%Distance_matrix1
%neighbor

%neighbor
%the i_th neighbor differs in Distance_matrix1(i) th row from the current strand

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


neighbor_cost_array= zeros(1, size_neighbor);
best_neighbor_index = Inf;

for i= 1:size_neighbor
   Neighbor_vector= convert_vector_to_matrix( neighbor(i,:), Data, Priority, n, m );
   neighbor_cost_array = fitness3( Neighbor_vector, m, n, Data, Priority);
  
   best_neighbor_index = i;
end

%disp('  ');
%Current_Strand
%Current_Strand_cost
Best_neighbor= neighbor(i,:);
Best_neighbor_cost= min(neighbor_cost_array);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DNADNADNADNA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Compare the best_neighbor with the current_node %%%%%%%%%%%%%%%%%%%%%

if(Current_Strand_cost > Best_neighbor_cost)
    
    Current_Strand_cost = Best_neighbor_cost;
    Current_Strand = Best_neighbor;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DNADNADNADNADNA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Change Radius %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% in each iteration Radius will change respectively

r = ( (n - 1)/(1 - max_iteration) )* iter + ( n - ((n-1)/(1 - max_iteration)) );
r = floor(r);

array_iteration(1, number) = iter;
%iter
array_fitness3(1, number) = Current_Strand_cost;
%Current_Strand_cost
number = number+1;

    iter=iter+1;    % increase counter of loop
     
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DNADNADNA

disp('  ');
disp('Final Solution');

Current_Strand
Current_Strand_cost
end % end of run number
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DNADNADNA
plot(array_iteration, array_fitness3);

%end
display('~~~~~~~~~~~~~~~~~~~~~');
