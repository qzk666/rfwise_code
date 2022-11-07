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
filename = 'F:/experiment_data/water_20cm/10_25/vibration_55hz/80ml/5';
[data,data_complex] = find_epc(filename);
%figure(2);plot(data)
%
t_arr = [33291 38241 41728];
figure(1);
for t = t_arr
high_data = data_complex(t:t+149);
high_data = high_data - mean(high_data);
res_high = fftshift(fft(high_data)/length(high_data));
plot(abs(res_high));hold on;
end