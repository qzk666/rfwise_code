function [ll] = res_ll(l_i,n_low,data_complex)
data_low_sugar_water_x = {};

res_low_arr = cell(n_low,1);
for i = 1:n_low
    low_data = data_complex(l_i{i,1});
    low_data = low_data - mean(low_data);
    data_low_sugar_water_x{i,1} = low_data;
    res_low = fftshift(fft(low_data)/length(low_data));
    res_low_arr{i,1} = abs(res_low);
    ttt = abs(res_low);
%     plot(ttt(57:86),'color',color_array{1,i_round});
%     hold on;
end

ll = cell_mean(res_low_arr);
end