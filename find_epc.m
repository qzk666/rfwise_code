function [epc_arr,count] = find_epc(data,data_complex,template) 

 I = find(data<0.015);

 sort(I);

 limit = 4e4;

 epc_left = 0;
 epc_right = 0;
 epc_left_arr = [];
 epc_right_arr = [];
 epc_arr = cell(1000,3);
 count = 0; %总共找了多少组
 flag = 0;
 last_left = 0;
 last_right = 0;
 offset = 150000;
 indee = [];
 for i = 2:length(I)
     if I(i) - I(i-1) > limit
         indee = [indee,I(i)/150000];
         count = count +1;
        
         epc_right = I(i);
         epc_left = I(i-1);
         temp_left = epc_left + 400;
         temp_right = temp_left + 1500;
         rrrrr = find_match(data(temp_left:temp_right),abs(template));
         l = rrrrr(1);
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
         epc_arr{count,3} = epc_left;
     end
 end
end

