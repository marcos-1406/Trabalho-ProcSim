clc; close all;clear all;

x(1:49) = 1;
x(50:99) = -1;
alpha = 0.95;
Fs = 48000;

for i = 100:100:(Fs*2-100)
    for j = 0:99
        x(i + j) = alpha^(i/100) * x(j+1);
    end
end

plot(x);
sound(x, Fs);