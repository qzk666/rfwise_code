function [] = plot_scatter(z)
x = real(z);
y = imag(z);
scatter(x,y);
end