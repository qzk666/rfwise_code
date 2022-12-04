function res = compute_phase(tt)
res = [];
for i = 1:length(tt)
    z = imag(tt(i))/real(tt(i));
    if real(tt(i)) >=0 && imag(tt(i)) >=0
        z = atan(z);
    elseif real(tt(i)) >=0 && imag(tt(i)) <=0
        z = atan(z)+2*pi;
    elseif real(tt(i)) <=0 && imag(tt(i)) >=0
        z = atan(z)+pi;
    elseif real(tt(i)) <=0 && imag(tt(i)) <=0
        z = atan(z)+pi;
    end
    res = [res;z];
end
end