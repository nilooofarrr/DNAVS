function out = Detect( T, X )
%If the strand X was in the Tube T out=0
%Else out=1;
d = size(T);

        for i= 1: d(1,2)
            if X==T{i}
             out=1;
            else
             out=0;
            end
        end

end

