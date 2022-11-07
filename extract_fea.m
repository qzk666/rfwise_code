function [rr] = extract_fea(data,data_complex,data_mean,round_num)
 [D,I] = sort(data_mean); %从小到大排序，最大的若干个作为高电平，最低的若干个作为低电平
 % I =1代表[1-150],I=2代表[151-300],以此类推
 
 %当低电平的有两个连着的下标，作为1的低电平。同理作为高电平
 %找到低电平
 low = 1:40;
 low_index_temp = I(low);
 low_index_final = [];
 l_i = {};%
 n_low = 1;
 for i = low
     %if ismember(I(i)+1,low_index_temp)
         low_index_final = [low_index_final I(i)];%low_index_final中元素的数量就是选中的块的数量
 end

 %plot(data);hold on;
 for i = low_index_final
 index = 150*(i-1)+1:150*i;
 l_i{n_low,1} = index;
 n_low = n_low +1;
 %plot(index,data(index),'g');hold on;
 end
 n_low = n_low -1;

 %保存l_i
%  filn = ['data/' 'water_50cm/' 'low_' num2str(i_round) '.mat'];
%  save(filn,"l_i");

 %找到高电平
 high = length(I)-40:length(I);
 high_index_temp = I(high);
 high_index_final = [];
 h_i = {};%high_index
 for i = high
     %if ismember(I(i)+1,high_index_temp)
         high_index_final = [high_index_final I(i)];
 
 end

% plot(data);hold on;
 n_high = 1;
 for i = high_index_final
 index = 150*(i-1)+1:150*i;
 h_i{n_high,1} = index;
 n_high = n_high +1;
 %plot(index,data(index),'r');hold on;
 end
 n_high = n_high -1;

 %保存h_i
%  filn = ['data/' 'water_50cm/' 'high_' num2str(i_round) '.mat'];
%  save(filn,"h_i");


data_low_sugar_water_x = {};

res_low_arr = cell(n_low,1);
for i = 1:n_low
    low_data = data_complex(l_i{i,1});
    low_data = low_data - mean(low_data);
    data_low_sugar_water_x{i,1} = low_data;
    res_low = fftshift(fft(low_data)/length(low_data));
    res_low_arr{i,1} = abs(res_low);
    ttt = abs(res_low);
%     plot(ttt(57:86),'color',color_array{1,i_round});
%     hold on;
end

ll = cell_mean(res_low_arr);

data_high_sugar_water_x = {};

res_high_arr = cell(n_high,1);
for i = 1:n_high
    high_data = data_complex(h_i{i,1});
    high_data = high_data - mean(high_data);
    data_high_sugar_water_x{i,1} = high_data;
    res_high = fftshift(fft(high_data)/length(high_data));
    res_high_arr{i,1} = abs(res_high);
    ttt= abs(res_high);
%     plot(ttt(57:86),'color',color_array{1,i_round});
%     hold on;
end

hh = cell_mean(res_high_arr);

%rr = (hh-ll)*1e3;
rr = hh-ll;
%rr = rr/(rr(70));

%plot(rr,'color',color_array{1,i_round});hold on;
end