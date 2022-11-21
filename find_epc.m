function [epc_arr,count,start] = find_epc(filename) 
 fi_2 = fopen(filename,'rb'); 
 
 x_inter_2 = fread(fi_2, 'float32');
 x_2 = x_inter_2(1:2:end) + 1i*x_inter_2(2:2:end);

 %plot(abs(x_2));
 m = 4/8;
 data = abs(x_2(length(x_2)*m:length(x_2)*m+1e6));

 data_complex = x_2(length(x_2)*m:length(x_2)*m+1e6);

 I = find(data<0.015);

 sort(I);

 limit = 4e4;

 epc_left = 0;
 epc_right = 0;
 epc_left_arr = [];
 epc_right_arr = [];
 epc_arr = cell(1000,2);
 count = 0; %总共找了多少组
 for i = 2:length(I)
     if I(i) - I(i-1) > limit
         count = count +1;
         epc_right = I(i);
         epc_left = I(i-1);
         
         temp_left = epc_left + 400;
         temp_right = temp_left + 1500;
         [l,r] = find_match(data(temp_left:temp_right),template);
         k = l + temp_left -1;

         epc_right = epc_right - 3e4;
         epc_left = epc_left + 1e4;
         for j = epc_left:epc_left+200
             if mod(j-k,150) ==0
                 epc_left = j;
                 break;
             end
         end
         
         epc_arr{count,1} = data(epc_left:epc_right);
         epc_arr{count,2} = data_complex(epc_left:epc_right);
     end
 end
end

