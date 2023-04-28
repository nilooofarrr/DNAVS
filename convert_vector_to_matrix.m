function matrix = convert_vector_to_matrix( vector, Data, Priority, n, m )
%Data n*m
%Priority n*m
matrix =zeros(m, n);

available_jobs_operation = ones(1, n);

%Dimension check
%(size(vector) == [1, n*m])
%(size(Data) == [n, m])
%(size(Priority) == [n, m])

if ( (size(vector) == [1, n*m]) & (size(Data) == [n, m]) & (size(Priority) == [n, m]) )

    for i=1:n*m

     j= vector(i);
    % j
     op= available_jobs_operation(j);
    % op
     available_jobs_operation(j) = available_jobs_operation(j)+1;
     m= Priority(j, op);
    % m
     
     p=1;
     while (matrix(m,p) ~= 0)
      p= p+1;
     end%end of while
     
     matrix(m,p)=j;
     % matrix(m,p)
     
    end%end of for


end%end of if

end

