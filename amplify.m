function Tube = amplify( T, m )
%create m copies from Tube T and return m simillar tube as an array of cells
%it returns a cell of Tubes

%Tube is a cell of cell of strands( = array)
Tube = cell(1, m);

    for i=1:m
      Tube{i}=T;
    end
end

