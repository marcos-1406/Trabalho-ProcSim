clc; close all;clear all;

x(1:49) = 1;
x(50:99) = -1;
alpha = 0.995;
Fs = 48000;

for i = 100:100:(Fs*2-100)
    for j = 0:99
        x(i + j) = alpha^(i/100) * x(j+1);
    end
end

sound(x, Fs);

[X,freq, table1] = my_fft(x, Fs);