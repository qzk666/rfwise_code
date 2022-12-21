function [hh] = res_hh(h_i,n_high,data_complex)
data_high_sugar_water_x = {};

res_high_arr = cell(n_high,1);
for i = 1:n_high
    high_data = data_complex(h_i{i,1});
    high_data = high_data - mean(high_data);
    data_high_sugar_water_x{i,1} = high_data;
    res_high = fftshift(fft(high_data)/length(high_data));
    res_high_arr{i,1} = abs(res_high);
    ttt= abs(res_high);
%     plot(ttt(57:86),'color',color_array{1,i_round});
%     hold on;
end

hh = cell_mean(res_high_arr);
end