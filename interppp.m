function res = interppp(a,index_final_vib,k)
lenlen = length(index_final_vib);
nn = length(index_final_vib)*k;
index_target = linspace(index_final_vib(1),index_final_vib(lenlen),nn);
res = interp1(index_final_vib,a,index_target);
end