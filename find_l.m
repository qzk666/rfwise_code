function [l_i,n_low] = find_l(I)
%当低电平的有两个连着的下标，作为1的低电平。同理作为高电平
 %找到低电平
 low = 1:20;
 low_index_temp = I(low);
 low_index_final = [];
 l_i = {};%
 n_low = 1;
 for i = low
     %if ismember(I(i)+1,low_index_temp)
         low_index_final = [low_index_final I(i)];%low_index_final中元素的数量就是选中的块的数量
 end

 %plot(data);hold on;
 for i = low_index_final
 index = 150*(i-1)+1:150*i;
 l_i{n_low,1} = index;
 n_low = n_low +1;
 %plot(index,data(index),'g');hold on;
 end
 n_low = n_low -1;
end