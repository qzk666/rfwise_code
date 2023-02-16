function smoothbitphase = getphasefromdiff(maxsignal,minsignal)
maxxsignal = [];
minnsignal = [];
for i = 1:length(maxsignal)
    temp = maxsignal{i};
    maxxsignal = [maxxsignal,temp(floor(length(temp)/2))];%取中间的作为代表
end

for i = 1:length(minsignal)
    temp = minsignal{i};
    minnsignal = [minnsignal,temp(floor(length(temp)/2))];
end

bitphasediff = angle(maxxsignal-minnsignal);%减去的不是平均值，而是临近值
bitphasediff = (unwrap(bitphasediff));
smoothbitphase = smooth(bitphasediff);
smoothbitphase = smoothbitphase - mean(smoothbitphase);
end
