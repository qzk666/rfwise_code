function [beginn,endd] = find_diff(data)
ampDiff = data(1:length(data)-1) - data(2:length(data));
[val,tempIndex] = findpeaks(abs(ampDiff),'MinPeakHeight',max(ampDiff)/2);
 beginn = tempIndex(1);
 endd = tempIndex(length(tempIndex));
end


