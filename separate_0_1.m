function [highdata,lowdata,highdata_complex,lowdata_complex] = separate_0_1(data,data_complex)
ampDiff = data(1:length(data)-1) - data(2:length(data));
[val,tempIndex] = findpeaks(abs(ampDiff),'MinPeakHeight',max(ampDiff)/2);
judge = []; 
tempIndex = tempIndex';
for i = tempIndex
    if(ampDiff(i)>0)
        judge =   [judge,0];%0代表down
    else
        judge = [judge,1];%1代表up
    end
end
highdata = {};
lowdata = {};
highdata_complex = {};
lowdata_complex = {};
pre = judge(1);
lowcount = 0;
highcount = 0;

for i = 2:length(judge)
    if pre ==0 && judge(i)==1
        lowcount = lowcount +1;
        lowdata{lowcount}=data(tempIndex(i-1)+10:tempIndex(i)-10);
        lowdata_complex{lowcount} = data_complex(tempIndex(i-1)+10:tempIndex(i)-10);
        pre = 1;
    elseif pre ==1 && judge(i) ==0
        highcount = highcount +1;
        highdata{highcount}=data(tempIndex(i-1)+10:tempIndex(i)-10);
        highdata_complex{highcount} = data_complex(tempIndex(i-1)+10:tempIndex(i)-10);
        pre = 0;
    end
end

end