fs = 48000;
T1 = 2;
T2 = 2;
x1 = 0:1/fs:T1; %时间序列
x2 = 0:1/fs:T2;

%信号序列，每隔两秒停两秒
f = 500; %信号频率
temp1 = 3*sin(2*pi*f*x1);
temp2 = zeros(1,length(x2));
temp = [temp1,temp2];

y = [];
for i = 1:30
    y = [y,temp];
end
%%
fs = 48000;
T1 = 60;
x1 = 0:1/fs:T1; %时间序列
f = 55; %信号频率
temp1 = 3*sin(2*pi*f*x1);


y = temp1;
%%

filename = '\\Users\\qzk\\Desktop\\sound\\55HZ.wav';
audiowrite(filename,y,fs);
