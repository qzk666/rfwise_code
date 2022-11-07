clc,
clear all,
close all
%%
%fi_1 = fopen('E:/RF-WISE-main/RF-WISE/gr-rf-wise/misc/data/trans','rb');
fi_1 = fopen('E:/rfwise_data/water4/trans','rb');
x_inter_1 = fread(fi_1, 'float32');
x_1 = x_inter_1(1:2:end) + 1i*x_inter_1(2:2:end);
%plot(abs(x_1));
x_1 = x_1(15733400:15733400+2999);
x_1 = x_1 - mean(x_1);
res1 = fftshift(fft(x_1)/length(x_1));
%plot(abs(res1));
[pks1,locs1] = findpeaks(abs(res1));
%  plot(locs1,pks1,'o',Color='r');hold on;
%  plot(abs(res1),Color='r');hold off;

index1 = 21:20:1481;
index2 = 1521:20:2901;
index = [index1,index2];
index = [index(1:70),index(78:end)];
origin = abs(res1(index));
%%
 %oil2
 fi_2 = fopen('E:/rfwise_data/oil2/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 x_2 = x_2(6.5e7:7e7);
 %plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(4288090:4288090+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 plot(locs2,pks2,'o',Color='b');hold on;
 plot(abs(res2),'Color','b');hold on;

%%
 fi_2 = fopen('E:/rfwise_data/oil2/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 x_2 = x_2(6.5e7:7e7);
 %plot(abs(x_2))

 
 x_2 = x_2(4288090:4288090+149);
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2,3000)/3000)
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 plot(locs2,pks2,'o',Color='r');hold on;
 plot(abs(res2),'Color','r');hold on;

%%


 fi_2 = fopen('E:/rfwise_data/oil3/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 temp = []
 for i=1:20
     temp = [temp;x_2(7171180:7171180+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 plot(locs2,pks2,'o',Color='r');hold on;
 plot(abs(res2),'Color','r');hold on;

 %%
 fi_2 = fopen('E:/rfwise_data/oil1/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 x_2 = x_2(3.7904e7:3.792e7);
% plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(1475:1475+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 plot(locs2,pks2,'o',Color='g');hold on;
 plot(abs(res2),'Color','g');hold off;
 %%
 fi_2 = fopen('E:/rfwise_data/water1/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
%x_2 = x_2(4.35e7:4.3503e7);
 x_2 = x_2(5.5e6:6e6);
 %plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(990:990+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.335;
 plot(locs2,pks2*coef,'o',Color='r');hold on;
 plot(abs(res2)*coef,'Color','r');hold on;
 
 fi_2 = fopen('E:/rfwise_data/water2/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 x_2 = x_2(3.4e7:3.4015e7);
 %plot(abs(x_2));
 temp = []
 for i=1:20
     temp = [temp;x_2(3439:3439+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.345;
 plot(locs2,pks2*coef,'o',Color='g');hold on;
 plot(abs(res2)*coef,'Color','g');hold on;
 
 fi_2 = fopen('E:/rfwise_data/water3/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 x_2 = x_2(2.7274e7:2.728e7);
 %plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(2458:2458+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.2;
 plot(locs2,pks2*coef,'o',Color='b');hold on;
 plot(abs(res2)*coef,'Color','b');hold on;
 
 fi_2 = fopen('E:/rfwise_data/water4/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 x_2 = x_2(2.1824e7:2.183e7);
 %plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(2369:2369+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.17;
 plot(locs2,pks2*coef,'o',Color=[0.5,0.5,0.5]);hold on;
 plot(abs(res2)*coef,'Color',[0.5,0.5,0.5]);hold on;

%%
 fi_2 = fopen('E:/rfwise_data/water5/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 %x_2 = x_2(7111750:7111750+149);
 %plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(7111750:7111750+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.4;
 plot(locs2,pks2*coef,'o',Color=[0.5,0.5,1]);hold on;
 plot(abs(res2)*coef,'Color',[0.5,0.5,1]);hold on;
 
 fi_2 = fopen('E:/rfwise_data/water6/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 %x_2 = x_2(7111750:7111750+149);
 %plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(8872270:8872270+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.385;
 plot(locs2,pks2*coef,'o',Color=[0.5,0.5,0.5]);hold on;
 plot(abs(res2)*coef,'Color',[0.5,0.5,0.5]);hold on;

 fi_2 = fopen('E:/rfwise_data/water7/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 %x_2 = x_2(7111750:7111750+149);
 %plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(20688300:20688300+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.373;
 plot(locs2,pks2*coef,'o',Color=[0.5,1,0.5]);hold on;
 plot(abs(res2)*coef,'Color',[0.5,1,0.5]);hold on;

fi_2 = fopen('E:/rfwise_data/water8/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 %x_2 = x_2(7111750:7111750+149);
 %plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(8915970:8915970+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.358;
 plot(locs2,pks2*coef,'o',Color='#000000');hold on;
 plot(abs(res2)*coef,'Color','#000000');hold on;
 
 fi_2 = fopen('E:/rfwise_data/water9/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 %x_2 = x_2(7111750:7111750+149);
 %plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(9038500:9038500+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.391;
 plot(locs2,pks2*coef,'o',Color='#6495ED');hold on;
 plot(abs(res2)*coef,'Color','#6495ED');hold on;

 
 fi_2 = fopen('E:/rfwise_data/water10/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 %x_2 = x_2(7111750:7111750+149);
 %plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(8315320:8315320+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.375;
 plot(locs2,pks2*coef,'o',Color='#CD5C5C');hold on;
 plot(abs(res2)*coef,'Color','#CD5C5C');hold on;
 %%
 fi_2 = fopen('E:/rfwise_data/sugar_water1/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 x_2 = x_2(1.1066e7:1.1074e7);
 %plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(3305:3305+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.27;
 plot(locs2,pks2*coef,'o',Color=[1,0,1]);hold on;
 plot(abs(res2)*coef,'Color',[1,0,1]);hold on;
 
 fi_2 = fopen('E:/rfwise_data/sugar_water2/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 x_2 = x_2(8.1853e7:8.1855e7);
 %plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(650:650+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.292;
 plot(locs2,pks2*coef,'o',Color=[1,0,0]);hold on;
 plot(abs(res2)*coef,'Color',[1,0,0]);hold on;
 
 fi_2 = fopen('E:/rfwise_data/sugar_water3/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 x_2 = x_2(3.9926e7:3.9928e7);
 %plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(553:553+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.3;
 plot(locs2,pks2*coef,'o',Color=[0,1,0]);hold on;
 plot(abs(res2)*coef,'Color',[0,1,0]);hold on;
 
 fi_2 = fopen('E:/rfwise_data/sugar_water4/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 x_2 = x_2(3.0684e7:3.069e7);
% plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(1401:1401+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.247;
 plot(locs2,pks2*coef,'o',Color=[0.5,0.5,0.5]);hold on;
 plot(abs(res2)*coef,'Color',[0.5,0.5,0.5]);hold on;
%%
 fi_2 = fopen('E:/rfwise_data/sugar_water5/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 %x_2 = x_2(21111300:21111300);
% plot(abs(x_2))
 temp = []
 for i=1:20
     temp = [temp;x_2(21111300:21111300+149)]
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.4;
 plot(locs2,pks2*coef,'o',Color='#8B4513');hold on;
 plot(abs(res2)*coef,'Color','#8B4513');hold on;

 %% sugar_water
 fi_2 = fopen('E:/rfwise_data/sugar_water6/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 %x_2 = x_2(21111300:21111300);
 %plot(abs(x_2))
 temp = [];
 temp2 =[];
 for i=1:20
     temp = [temp;x_2(3683400:3683400+149)];
     temp2 = [temp2;x_2(6680060:6680060+149)];
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.38;
%  plot(locs2,pks2*coef,'o',Color='#CD853F');hold on;
%  plot(abs(res2)*coef,'Color','#CD853F');hold on;
 x_3 = temp2;
 x_3 = x_3 - mean(x_3);
 res3 = fftshift(fft(x_3)/length(x_3));

 index1 = 21:20:1481;
 index2 = 1521:20:2901;
 index = [index1,index2];
 index = [index(1:70),index(78:end)];
 res = (abs(res2(index))-abs(res3(index)))*coef;
 res = res./origin;
 plot(res);hold on;
 
 
 fi_2 = fopen('E:/rfwise_data/sugar_water7/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 %x_2 = x_2(21111300:21111300);
 %plot(abs(x_2))
 temp = [];
 temp2 =[];
 for i=1:20
     temp = [temp;x_2(7245830:7245830+149)]
     temp2 = [temp2;x_2(8142460:8142460+149)];
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.39;
%  plot(locs2,pks2*coef,'o',Color='#6A5ACD');hold on;
%  plot(abs(res2)*coef,'Color','#6A5ACD');hold on;
 x_3 = temp2;
 x_3 = x_3 - mean(x_3);
 res3 = fftshift(fft(x_3)/length(x_3));

 index1 = 21:20:1481;
 index2 = 1521:20:2901;
 index = [index1,index2];
 index = [index(1:70),index(78:end)];
 res = (abs(res2(index))-abs(res3(index)))*coef;
 res = res./origin;
 plot(res);hold on;
 
 fi_2 = fopen('E:/rfwise_data/sugar_water8/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 %x_2 = x_2(21111300:21111300);
 %plot(abs(x_2))
 temp = [];
 temp2 =[];
 for i=1:20
     temp = [temp;x_2(9053570:9053570+149)];
     temp2 = [temp2;x_2(10515200:10515200+149)];
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.383;
%  plot(locs2,pks2*coef,'o',Color='#191970');hold on;
%  plot(abs(res2)*coef,'Color','#191970');hold on;
x_3 = temp2;
 x_3 = x_3 - mean(x_3);
 res3 = fftshift(fft(x_3)/length(x_3));

 index1 = 21:20:1481;
 index2 = 1521:20:2901;
 index = [index1,index2];
 index = [index(1:70),index(78:end)];
 res = (abs(res2(index))-abs(res3(index)))*coef;
 res = res./origin;
 plot(res);hold on;
 %%
 fi_2 = fopen('E:/rfwise_data/sugar_water9/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 %x_2 = x_2(21111300:21111300);
 %plot(abs(x_2))
 temp = [];
 temp2 = [];
 for i=1:20
     temp = [temp;x_2(12640500:12640500+149)];
     temp2 = [temp2;x_2(13354900:13354900+149)];
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.384;
%  plot(locs2,pks2*coef,'o',Color='#2F4F4F');hold on;
%  plot(abs(res2)*coef,'Color','#2F4F4F');hold on;
 x_3 = temp2;
 x_3 = x_3 - mean(x_3);
 res3 = fftshift(fft(x_3)/length(x_3));

 index1 = 21:20:1481;
 index2 = 1521:20:2901;
 index = [index1,index2];
 index = [index(1:70),index(78:end)];

 res = (abs(res2(index))-abs(res3(index)))*coef;
 res = res./origin;
 plot(res);hold on;
 %%
 fi_2 = fopen('E:/rfwise_data/sugar_water10/source','rb');
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);
 %x_2 = x_2(21111300:21111300);
 %plot(abs(x_2))
 temp = [];
 temp2 = [];
 for i=1:20
     temp = [temp;x_2(18745300:18745300+149)];
     temp2 = [temp2;x_2(15733400:15733400+149)];
 end
 
 x_2 = temp;
 x_2 = x_2 - mean(x_2);
 res2 = fftshift(fft(x_2)/length(x_2))
 %plot(abs(res2))
 [pks2,locs2] = findpeaks(abs(res2));
 coef = 0.5/0.400;
%   plot(locs2,pks2*coef,'o',Color='#000000');hold on;
%   plot(abs(res2)*coef,'Color','#000000');hold on;

 x_3 = temp2;
 x_3 = x_3 - mean(x_3);
 res3 = fftshift(fft(x_3)/length(x_3));
 [pks3,locs3] = findpeaks(abs(res3));
 coef = 0.5/0.400;

 index1 = 21:20:1481;
 index2 = 1521:20:2901;
 index = [index1,index2];
 index = [index(1:70),index(78:end)];

 res = (abs(res2(index))-abs(res3(index)))*coef;
 res = res./origin;
 plot(res);hold on;
