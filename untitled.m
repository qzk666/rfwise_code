clc,
clear all,
close all
%%
%加载匹配模版
load template.mat; %匹配RN16
load template2.mat; %匹配恒定波
%%
%  fi_2 = fopen('/Volumes/aigo/rfwise_data/sugar_water7/source','rb'); 
%  x_inter_2 = fread(fi_2, 'float32');
%  x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
% 
%  l = length(x_2);
%  test_data = abs(x_2(l/2:l/2+1e6));
%  test_data_complex = x_2(l/2:l/2+1e6);%复数形式
% 
%  res = find_match(test_data,template);
%  figure(2)
%  plot(test_data,'r');hold on;
%  plot(res(1):res(2),test_data(res(1):res(2)),'b');
%  data = test_data(res(1)+55000:res(1)+55000+35000);
%  %plot(data);hold on;
%  data_complex = test_data_complex(res(1)+55000:res(1)+55000+35000);
 filename = '/Volumes/aigo/rfwise_data/sugar_water8/source';

 [data,data_complex] = find_epc(filename);
 
 %TODO:利用均值分辨高低电平

 round_num = floor(length(data)/150);
 data_mean = [];
 for i = 1:round_num
     temp = data((i-1)*150+1:(i-1)*150+150);
     data_mean = [data_mean,mean(temp)];  
 end

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


data_low_sugar_water_x = {};
for i = 1:n_low
    low_data = data_complex(l_i{i,1});
    low_data = low_data - mean(low_data);
    data_low_sugar_water_x{i,1} = low_data;
    res_low = fftshift(fft(low_data)/length(low_data));
    plot(abs(res_low),'g');
    hold on;
end


data_high_sugar_water_x = {};
for i = 1:n_high
    high_data = data_complex(h_i{i,1});
    high_data = high_data - mean(high_data);
    data_high_sugar_water_x{i,1} = high_data;
    res_high = fftshift(fft(high_data)/length(high_data));
    plot(abs(res_high),'color','#000000');
    hold on;
end
%%
save data_low_sugar_water_x.mat data_low_sugar_water_x;
save data_high_sugar_water_x.mat data_high_sugar_water_x;
%储存的变量已经减去均值了，要用的时候直接FFT即可


 







%%
 %TODO：找到coef,也同样使用correlate
 %template2 =  abs(x_2(2.1207e7:2.1212e7));
 l = length(x_2);
 test_data2 = abs(x_2(l/2:l/2+1e6));
 res2 = find_match(test_data2,template2);
 t = mean(test_data2(res2(1):res2(2)));
 coef = 0.5/t;

 %%FFT
 low_data = data_complex(l_i);
 low_data = low_data - mean(low_data);
 res_low = fftshift(fft(low_data)/length(low_data));

 high_data = data_complex(h_i);
 high_data = high_data - mean(high_data);
 res_high = fftshift(fft(high_data)/length(high_data));
 %TODO:处理得到的FFT数据。注意low_data和high_data不再是3000个，而且是复数，需要取abs之后再提取特征
 %把数据都处理一下（提取某些频率的峰值）并且用save命令存起来

 gap_low = length(low_index_final);
 gap_high = length(high_index_final);

 feature_low_temp = abs(res_low(gap_low+1:gap_low:end));

 feature_high_temp = abs(res_high(gap_high+1:gap_high:end));

 select_freq = [1:70,80:100];

 feature_low_final = feature_low_temp(select_freq)*coef;

 feature_high_final = feature_high_temp(select_freq)*coef;

 plot(feature_high_final,'r');hold on;
 plot(feature_low_final,'b');hold on;
 legend('high','low')

 %TODO:把一些功能单独写成一个函数，让代码不要这么臃肿



 %%
 feature_low_sugar_water_6 = feature_low_final;

 feature_high_sugar_water_6 = feature_high_final;

 save feature_low_sugar_water_6.mat feature_low_sugar_water_6;

 save feature_high_sugar_water_6.mat feature_high_sugar_water_6;





