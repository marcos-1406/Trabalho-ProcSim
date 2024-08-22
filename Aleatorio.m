clc; close all;clear all;

x = randn(1,100);
alpha = 0.995;
Fs = 48000;

for i = 100:100:(Fs*2-100)
    for j = 0:99
        x(i + j) = alpha^(i/100) * x(j+1);
    end
end

plot(x(1:199));
sound(x, Fs);