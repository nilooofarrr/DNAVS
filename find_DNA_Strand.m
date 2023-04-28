function DNA_Strand_out = find_DNA_Strand( Tube, cost )
%return the strand with given cost
DNA_Strand_out =cell(1,1);
d=size(Tube);
index =size(Tube{1});
last_index = index(1,2);

for i=1:d(1,2)
 if Tube{i}(last_index) == cost
   DNA_Strand_out = Tube{i};
   break
 end
end


end

