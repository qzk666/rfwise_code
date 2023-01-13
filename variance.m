function res = variance(data)
n = 10;
res = [];
for i =1:length(data)-(n-1)
    temp = data(i:i+(n-1));
    va = std(temp,1);
    res = [res,va];
end

end