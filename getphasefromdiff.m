function smoothbitphase = getphasefromdiff(maxsignal,minsignal)
maxxsignal = [];
minnsignal = [];
for i = 1:length(maxsignal)
    temp = maxsignal{i};
    maxxsignal = [maxxsignal,temp(floor(length(temp)/2))];
end

for i = 1:length(minsignal)
    temp = minsignal{i};
    minnsignal = [minnsignal,temp(floor(length(temp)/2))];
end

bitphasediff = angle(maxxsignal-minnsignal);
bitphasediff = (unwrap(bitphasediff));
smoothbitphase = smooth(bitphasediff);
smoothbitphase = smoothbitphase - mean(smoothbitphase);
end
