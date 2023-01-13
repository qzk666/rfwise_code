function res = variance(data)
n = 10;
res = [];
for i =1:length(data)-9
    temp = data(i:i+9);
    va = std(temp,1);
    res = [res,va];
end

end