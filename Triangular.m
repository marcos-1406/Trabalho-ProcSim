clc; close all;clear all;

n = 0:1:99;
x = (2*n)/100 - 1;
alpha = 1;
Fs = 48000;

for i = 100:100:(Fs*2-100)
    for j = 0:99
        x(i + j) = alpha^(i/100) * x(j+1);
    end
end

plot(x);
sound(x, Fs);