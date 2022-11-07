function [res,res_complex] = find_epc(filename)
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
 
 for i = 2:length(I)
     if I(i) - I(i-1) > limit
         epc_right = I(i);
         epc_left = I(i-1);
         break;
     end
 end

 epc_right = epc_right - 3e4;

 epc_left = epc_left + 1e4;

 res = data(epc_left:epc_right);

 res_complex = data_complex(epc_left:epc_right);

end

