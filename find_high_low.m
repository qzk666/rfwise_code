clc,
clear all,
close all
%%
%加载匹配模版
%load template.mat; %匹配RN16
%load template2.mat; %匹配恒定波
fi_2 = fopen('F:/experiment_data/water_20cm/10_25/no_vibration/80ml/4','rb'); 
x_inter_2 = fread(fi_2, 'float32');
x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
plot(abs(x_2));
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
color_array = {'#000000' '#589453' '#512321' 'red' 'green' 'blue' '#DACDA2' '#113521' '#52312D' '#DCA561'};
num_valid = 0;
round_index = [5:5];
 for i_round = round_index
 %filename = ['/Volumes/My_Passport/experiment_data/water_50cm/' num2str(i_round) '/source' ];
 %filename = ['F:/experiment_data/water_20cm/2022_10_22/250ml/' num2str(i_round) '/source']
 filename = ['F:/experiment_data/water/10_28/120ml/' num2str(i_round)];
 %filename = 'F:/experiment_data/water_30cm/4/source';

 [data,data_complex] = find_epc(filename);
 plot(data);
 if length(data) == 0
     continue;
 end

 
 %TODO:利用均值分辨高低电平

 round_num = floor(length(data)/150);
 data_mean = [];
 for i = 1:round_num
     temp = data((i-1)*150+1:(i-1)*150+150);
     data_mean = [data_mean,mean(temp)];  
 end
 if length(data_mean) <100
     continue;
 end


 
rr = extract_fea(data,data_complex,data_mean,round_num);
%rr = rr/(rr(70));

%plot(rr,'color',color_array{1,i_round});hold on;
num_valid = num_valid +1;

 end
%%
save data_low_sugar_water_x.mat data_low_sugar_water_x;
save data_high_sugar_water_x.mat data_high_sugar_water_x;
%储存的变量已经减去均值了，要用的时候直接FFT即可


 


 fi_2 = fopen('F:/experiment_data/water_20cm/1/source','rb'); 
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
figure(2)
 plot(abs(x_2));






 %%
 feature_low_sugar_water_6 = feature_low_final;

 feature_high_sugar_water_6 = feature_high_final;

 save feature_low_sugar_water_6.mat feature_low_sugar_water_6;

 save feature_high_sugar_water_6.mat feature_high_sugar_water_6;

a = [1 2 3]
b = [1 2 3]
c = a - b


