function [res] = correlate_self(a,b)
temp = dot(a,b);
abs_a = sqrt(dot(a,a));
abs_b = sqrt(dot(b,b));
res = temp/(abs_a*abs_b);
end


