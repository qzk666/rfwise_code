function []=plot_all(x_const,index_final_vib,index_final_not_vib)
figure(1);
plot(abs(x_const));hold on;
p1 = [];
p2 = [];
% for i = index_final_vib
%     for j =0:149
%         p1 = [p1,i+j];
%     end
%     figure(1);
%     plot(p1,abs(x_const(p1)),'r');hold on;
%     p1= [];
% end

for i = index_final_not_vib
    for j =0:149
        p2 = [p2,i+j];
    end
    figure(1);
    plot(p2,abs(x_const(p2)),'g');hold on;
    p2 = [];
end
end