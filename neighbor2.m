function DNA_Strand_out = neighbor2( DNA_Strand_in, r, m, n )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The neighbor function does below thing r times:
 
    %1-pick 2 rndom index
    %2-replace
 %PS: the DNA_Strand is a m*n array    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
%r element in given DNA_Strand will change 

    
   %pick r random index between 1 and m*n
   %save those indices in index_arr
   index_arr1 = zeros(1, r);
   index_arr2 = zeros(1, r);
   
    for i = 1:r
       index_arr1(i) = randi([1 m*n]);
    end
    
   %give a random replacement to those indices
    new_permutation = randperm(r);
    
    for i=1:r
     index_arr2(new_permutation(i)) = index_arr1(i);
    end
    
    
    %build result based on new permutation
    % I should replace the element which is in index_arr1(i) with index_arr2(i)
  
    for i=1:r
     temp = DNA_Strand_in(index_arr2(i));
     DNA_Strand_in(index_arr2(i)) = DNA_Strand_in(index_arr1(i));
     DNA_Strand_in(index_arr1(i)) = temp;
    end
    %}
    
    %###############################################################################################################
    %########################################### replace r element from DNA_STrand_in ##############################
    R=r;
    
    Strand = DNA_Strand_in;
while(R~=0)
 
    %1-pick 2 rndom index
    %2-replace
    
    element1= randi([1, m*n]);
    element2= randi([1, m*n]);
  
    temp=Strand(element1);
    Strand(element1) = Strand(element2);
    Strand(element2)=temp;

  %  disp('  ')
  %  disp ('We know sth had changed')
    
     R=R-1;
end
    
   
    
    DNA_Strand_out = Strand;
end
    
