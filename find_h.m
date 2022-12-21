function [h_i,n_high] = find_h(I)
 %找到高电平
 high = length(I)-50:length(I);
 high_index_temp = I(high);
 high_index_final = [];
 h_i = {};%high_index
 for i = high
     %if ismember(I(i)+1,high_index_temp)
         high_index_final = [high_index_final I(i)];
 
 end
 high_index_final = sort(high_index_final);

% plot(data);hold on;
 n_high = 1;
 for i = high_index_final
 index = 150*(i-1)+1:150*i;
 h_i{n_high,1} = index;
 n_high = n_high +1;
 %plot(index,data(index),'r');hold on;
 end
 n_high = n_high -1;
end