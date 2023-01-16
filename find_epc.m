function [epc_arr,count] = find_epc(data,data_complex) 
 
 I = find(data<0.015);

 sort(I);

 limit = 4e4;
 epc_arr = cell(1000,3);
 count = 0; %总共找了多少组
 for i = 2:length(I)
     if I(i) - I(i-1) > limit
         count = count +1;
        
         epc_right = I(i);
         epc_left = I(i-1);
         ttt = epc_left;

         temp_epc = data(epc_left+100:epc_right-100);
         [beginn,endd] = find_diff(temp_epc);
         
         epc_left = ttt+100+beginn-1;
         epc_right = ttt+100+endd-1;


         epc_arr{count,1} = data(epc_left:epc_right);
         epc_arr{count,2} = data_complex(epc_left:epc_right);
         epc_arr{count,3} = epc_left;
     end
 end
end

