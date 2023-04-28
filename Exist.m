function out = Exist( DNA_Strand, X )
%if The DNA_strand had X as substring return 1 else return0
%the reresentation of X here is AiBj which means j th job assigned to i th machine
%extract i and j first

i= mod(X,10);
j= floor(x/10);

        if DNA_Strand(j)== i
        out = 1;
        else
        out = 0;
        end


end

