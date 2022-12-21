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
fi_2 = fopen('/media/dislab/My_Passport/experiment_data/water/test/1','rb'); 
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
fi_2 = fopen('F:/experiment_data/water/12_3/55hz_not_continue/4','rb'); 
x_inter_2 = fread(fi_2, 'float32');
x = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
plot(abs(x));hold on;
inn = 91;
plot(index_final_vib(inn):index_final_vib(inn)+149,abs(x(index_final_vib(inn):index_final_vib(inn)+149)));
% beginn = 18568700;
% endd = 18577500;
beginn = 3464000;
endd = 3476000;
x = x(beginn:endd);
%x = x - mean(x);
%x = filter(HPF,x);
%plot(fftshift(abs(fft(x)))/length(x))
x_2 = real(x);
y_2 = imag(x);
figure(3);
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

color_array = {'#000000' '#589453' '#512321' 'red' 'green' 'blue' '#DACDA2' '#113521' '#52312D' '#DCA561'};
num_valid = 0;
round_index = 1;
load template.mat;
pha = [];
origin_complex_pha_vib = [];
origin_complex_pha_not_vib = [];
 for i_round = round_index
     index_final_not_vib = [];
     index_final_vib = [];
      filename = ['/media/dislab/My_Passport/experiment_data/water/test/' num2str(i_round)];
 %filename = 'F:/experiment_data/water_30cm/4/source';
        fi_2 = fopen(filename,'rb'); 
        x_inter_2 = fread(fi_2, 'float32');
        x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
        time =length(x_2)/25e6;
        x_const = x_2;
 for flag = 0:1%1:vib,0:not vib
 %filename = ['/Volumes/My_Passport/experiment_data/water_50cm/' num2str(i_round) '/source' ];
 %filename = ['F:/experiment_data/water_20cm/2022_10_22/250ml/' num2str(i_round) '/source']
% filename = 'F:/experiment_data/water/11_26/no_vib/10';
 x_2 = x_const;
 if flag ==0 %no vib
     if i_round == 1
     beginn_0 =978623;
     endd_0 = 6705220;
     elseif i_round == 3
     beginn_0 = 61270900;
     endd_0 = 65689200;
     end
     x_2 = x_2(beginn_0:endd_0);
 else % vib
     if i_round == 1
     beginn_1 =0.5e7;
     endd_1 = 5.5e7;
     elseif i_round ==3
     beginn_1 = 2518970;
     endd_1 = 50035700;
     end
     x_2 = x_2(beginn_1:endd_1);
 end
 %plot(abs(x_2));
 m = 1/50;
 p = 49/50;
 data = abs(x_2(length(x_2)*m:length(x_2)*p));
 data_complex = x_2(length(x_2)*m:length(x_2)*p);
 start_index = length(x_2)*m;


 [tee,count] = find_epc(data,data_complex,template);
 [line,column] = size(tee);
 for co = 1:count
 data = tee{co,1};
 data_complex = tee{co,2};
 ii = tee{co,3} + start_index;
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

[rr,tt,iii] = extract_phase(data,data_complex,data_mean,round_num,ii);
if flag == 0
index_final_not_vib = [index_final_not_vib,iii+beginn_0];
else
    index_final_vib = [index_final_vib,iii+beginn_1];
end
%TODO:插值
if flag == 1
origin_complex_pha_vib = [origin_complex_pha_vib,tt];
else
    origin_complex_pha_not_vib = [origin_complex_pha_not_vib,tt];
end
rr =  rr.';
pha = [pha;rr];
 end
if flag ==1
origin_complex_pha_vib = origin_complex_pha_vib';
else
origin_complex_pha_not_vib = origin_complex_pha_not_vib';
end
%rr = rr/(rr(70));
if flag == 0
    avv = mean(origin_complex_pha_not_vib);
end
 end



%plot(rr,'color',color_array{1,i_round});hold on;
num_valid = num_valid +1;
index_final_vib = int32(index_final_vib);
index_final_not_vib = int32(index_final_not_vib);
%plot_all(x_const,index_final_vib,index_final_not_vib);
%plot(pha(1:end,7));hold on;
 end
%%
plot(compute_phase(origin_complex_pha_not_vib(1:end,30)));
%%
cc = origin_complex_pha_not_vib(1:end,60);
plot_scatter(cc);
%%
%减去对照组
cc = origin_complex_pha_vib;
indexxx = 20;
cc = cc(1:end,indexxx);
cc = cc - avv(indexxx);

a = compute_phase(cc);
a(find(a<2.5))=a(find(a<2.5))+2*pi;
lenlen = length(index_final_vib);
k = 2;
nn = length(index_final_vib)*k;
index_target = linspace(index_final_vib(1),index_final_vib(lenlen),nn);
a = interp1(index_final_vib,a,index_target);
a(find(a<2.5))=a(find(a<2.5))+2*pi;
% index = [1:200];
% a = pha(index,15);
a = a - mean(a);

%a = filter(BPF,a);
%a = movmean(a,3);
%plot(abs(fft(a)));

N = length(a);
x = fft(a);
m = abs(x)/N*2;
f = (0:N-1)*167*51*k/N;
figure(2);
plot(f(1:floor(end/2)),m(1:floor(end/2)));
%%
l = 150;
kk = cc(1+151*(l-1):151*l);
a = compute_phase(kk);
x_2 = real(kk);
y_2 = imag(kk);
figure(3);
scatter(x_2,y_2,'red');
%%
x_2 = real(cc);
y_2 = imag(cc);
figure(3);
scatter(x_2,y_2,'red');
%%
%没有减去对照组
%indeex = [30,60,90,120];
i = 30;
cc = origin_complex_pha_vib;
cc = cc(1:end,i);
a = cc;
%a = interppp(a,index_final_vib,2);
% a(find(a<2.5))=a(find(a<2.5))+2*pi;
% index = [1:200];
% a = pha(index,15);
a = a - mean(a);


%a = filter(BPF,a);
%a = movmean(a,3);
%plot(abs(fft(a)));
  filename = ['/media/dislab/My_Passport/experiment_data/water/test/1'];
 %filename = 'F:/experiment_data/water_30cm/4/source';
        fi_2 = fopen(filename,'rb'); 
        x_inter_2 = fread(fi_2, 'float32');
        x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
a = x_2;
N = length(a);
x = fft(a);
m = abs(x)/N*2;
f = (0:N-1)*25e6/N;
plot(f(1:5000),m(1:5000));
plot(f(1:floor(end/2)),m(1:floor(end/2)));






