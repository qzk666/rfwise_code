function [res] = cell_mean(arr)
[m,n] = size(arr);
res = [];
temp = [];
for i = 1:150
    for j = 1:m
        t = arr{j,1};
        temp = [temp,t(i)];
    end
    res = [res mean(temp)];
    temp = [];
end
