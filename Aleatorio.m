clc; close all;clear all;

x = randn(1,100);
alpha = 0.995;
Fs = 48000;

sound(x, Fs);

for i = 100:100:(Fs*2-100)
    for j = 0:99
        x(i + j) = alpha^(i/100) * x(j+1);
    end
end

sound(x, Fs);

[X,freq, table1] = my_fft(x, Fs);