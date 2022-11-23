function [res] = extract_phase(data,data_complex,data_mean,round_num)
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
temp = zeros(150,1);
for i = 1:n_high
    temp = temp + data_complex(h_i{i,1});
end
temp = temp/n_high;

temp2 = zeros(150,1);
for i = 1:n_low
    temp2 = temp2 + data_complex(l_i{i,1});
end
temp2 = temp2/n_low;

tt = temp;
res = [];
for i = 1:150
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
