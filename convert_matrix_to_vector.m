function  vector  = convert_matrix_to_vector( matrix, data, Priority, n, m )

%Data n*m
%Priority n*m
vector =zeros(1,m*n);
i=1;
%Dimension check
if ( (size(matrix) == [m, n]) & (size(data) == [n, m]) & (size(Priority) == [n, m]) )


for l=1:n
    for k=1:m
     vector(i) = matrix(k, l);
     i=i+1;
    end
end%end of second for


end%end of if

end

