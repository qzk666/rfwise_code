clc,
clear all,
close all
%%
%加载匹配模版
%load template.mat; %匹配RN16
%load template2.mat; %匹配恒定波
fi_2 = fopen('F:/experiment_data/water/11_26/no_vib/12','rb'); 
x_inter_2 = fread(fi_2, 'float32');
x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
x_2 = x_2(2.6e7:3.4e7);
%plot(abs(x_2));
N = length(x_2);
x = fft(x_2);
m = abs(x);
f = (0:N-1)*25e6/N;
plot(f(1:1000),m(1:1000));
%x_2 = x_2(2.006e7:2.0065e7);
figure(1)
%plot(abs(x_2(1.5e7:2e7)));
x_2 = x_2(1.5e7:2e7);
template = x_2(2861280-65:2861280-65+149);
figure(2);
plot(abs(template));
save template.mat template;

%%
%加载匹配模版
%load template.mat; %匹配RN16
%load template2.mat; %匹配恒定波
fi_2 = fopen('F:/experiment_data/water/12_3/55hz_not_continue/1','rb'); 
x_inter_2 = fread(fi_2, 'float32');
x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
plot(abs(x_2));
x_2 = x_2(2.0964e7:2.097e7);
rrrr = fft(x_2);
rrrr = rrrr-mean(rrrr);
rrrr = rrrr(2:end);
figure(1)
plot(abs(rrrr));
%%
figure(4)
fi_2 = fopen('F:/experiment_data/water/10_28/120ml/2','rb'); 
x_inter_2 = fread(fi_2, 'float32');
x = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
plot(abs(x))
% beginn = 18568700;
% endd = 18577500;
beginn = 1.187e7;
endd = 1.1874e7;
x = x(beginn:endd);
%x = x - mean(x);
%x = filter(HPF,x);
%plot(fftshift(abs(fft(x)))/length(x))
x_2 = real(x);
y_2 = imag(x);
figure(2);
scatter(x_2,y_2,'red');
hold on;
% xlim([-1,0]);
% ylim([-0.5,0.5]);
axis equal;
figure(3);
lll = length(x_2);
zz = [];
for i = 1:lll
    z = y_2(i)/x_2(i);
    if x_2(i) >=0 && y_2(i) >=0
        z = atan(z);
    elseif x_2(i) >=0 && y_2(i) <=0
        z = atan(z)+2*pi;
    elseif x_2(i) <=0 && y_2(i) >=0
        z = atan(z)+pi;
    elseif x_2(i) <=0 && y_2(i) <=0
        z = atan(z)+pi;
    end
    zz = [zz,z];
end
plot(zz),hold on;
% yy = ones(length(z),1);
% scatter(z,yy,'red');hold on;
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
round_index = 1;
load template.mat;
pha = [];
origin_complex_pha = [];
 for i_round = round_index
 %filename = ['/Volumes/My_Passport/experiment_data/water_50cm/' num2str(i_round) '/source' ];
 %filename = ['F:/experiment_data/water_20cm/2022_10_22/250ml/' num2str(i_round) '/source']
 filename = 'F:/experiment_data/water/11_26/no_vib/10';
 filename = ['F:/experiment_data/water/12_3/55hz_continue/' num2str(i_round)];
 %filename = 'F:/experiment_data/water_30cm/4/source';
 [tee,count] = find_epc(filename,template);
 [line,column] = size(tee);
 for co = 1:count
 data = tee{co,1};
 data_complex = tee{co,2};
 %plot(data(301:450));
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

[rr,tt] = extract_phase(data,data_complex,data_mean,round_num);
origin_complex_pha = [origin_complex_pha,tt];
rr =  rr.';
pha = [pha;rr];
 end
 
origin_complex_pha = origin_complex_pha';
%rr = rr/(rr(70));

%plot(rr,'color',color_array{1,i_round});hold on;
num_valid = num_valid +1;
%plot(pha(1:end,7));hold on;
 end

%%
cc = origin_complex_pha(1:200,1:end);
avv = mean(origin_complex_pha(310:340,1:end));
cc = cc - avv;
cc = cc(1:end,50);
a = compute_phase(cc);
% index = [1:200];
% a = pha(index,15);
a = a - mean(a);
%a = movmean(a,3);
%plot(abs(fft(a)));

N = length(a);
x = fft(a);
m = abs(x)/N*2;
f = (0:N-1)*167/N;
plot(f(1:floor(end/2)),m(1:floor(end/2)));
%%
a = pha(1:end,30);
a = a - mean(a);
%a = movmean(a,3);
%plot(abs(fft(a)));

N = length(a);
x = fft(a);
m = abs(x)/N*2;
f = (0:N-1)*167/N;
plot(f(1:floor(end/2)),m(1:floor(end/2)));






