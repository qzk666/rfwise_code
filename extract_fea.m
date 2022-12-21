function [rr] = extract_fea(data,data_complex,data_mean,round_num)
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


ll = res_ll(l_i,n_low,data_complex);

hh = res_hh(h_i,n_high,data_complex);
%rr = (hh-ll)*1e3;
rr = hh-ll;
%rr = rr/(rr(70));

%plot(rr,'color',color_array{1,i_round});hold on;
end