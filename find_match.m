function [res] = find_match(a,b)%a大，b小,res是匹配的a的部分的左右下标
lena = length(a);
lenb = length(b);
temp_res = [];
for i = 1:(lena-lenb+1)
    x = a(i:lenb+i-1);
    t = correlate_self(x,b);
    temp_res = [temp_res,t];
end

[C,I] = max(temp_res);

res = [I,I+lenb-1];
end