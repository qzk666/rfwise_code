function [beginn,endd] = find_diff(data)
ampDiff = data(1:length(data)-1) - data(2:length(data));
[val,tempIndex] = findpeaks(abs(ampDiff),'MinPeakHeight',max(ampDiff)/2);
 beginn = tempIndex(1);
 endd = tempIndex(length(tempIndex));
end


a = [0 1 2 3 1 2 89 90 100 2 3 4];
[val,tempIndex] = findpeaks(abs(a),'MinPeakHeight',max(a)/2);