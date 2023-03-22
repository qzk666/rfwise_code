function [res,tt,index,ooo,temp2] = extract_phase(data,data_complex,data_mean,round_num,ii)
[D,I] = sort(data_mean); %从小到大排序，最大的若干个作为高电平，最低的若干个作为低电平
 % I =1代表[1-150],I=2代表[151-300],以此类推
[l_i,n_low] = find_l(I);
 %保存l_i
%  filn = ['data/' 'water_50cm/' 'low_' num2str(i_round) '.mat'];
%  save(filn,"l_i");

[h_i,n_high] = find_h(I);

 %保存h_i
%  filn = ['data/' 'water_50cm/' 'high_' num2str(i_round) '.mat'];
%  save(filn,"h_i");
temp = zeros(150,n_high);
index = [];
ooo = zeros(150,1);
for i = 1:n_high
    temm = h_i{i,1};
    ooo = ooo +data_complex(temm);
    temp(1:end,i) = data_complex(temm);
    index = [index,temm(1)+ii];
    %temp = temp + data_complex(h_i{i,1});
end
ooo = ooo/n_high; % ooo是表示所有high的平均值

temp2 = zeros(150,1);
for i = 1:n_low
    temp2 = temp2 + data_complex(l_i{i,1});
end
temp2 = temp2/n_low;

tt = ooo-temp2; %控制MSD
res = [];
[line,column] = size(tt);
for i =1:column
    teee = tt(1:end,i);
    pp = compute_phase(teee);
    res = [res,pp];
end


end


