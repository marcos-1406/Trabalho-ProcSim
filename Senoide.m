clc; close all;clear all;

n = 0:1:99;
x = sin(2*pi*n/100);
alpha = 0.995;
Fs = 48000;

for i = 100:100:(Fs*2-100)
    for j = 0:99
        x(i + j) = alpha^(i/100) * x(j+1);
    end
end

Y = fft(x);
L = length(Y);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs/L*(0:(L/2));

figure();
plot(f,P1); 
title("Resposta em frequência (Senóide) - Magnitude")
xlabel("freq (Hz)")
ylabel("|fft(X)|")

figure;
plot(angle(Y/L))
