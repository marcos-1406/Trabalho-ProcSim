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


fourier = fft(x);

figure;
subplot(3,1,1);
plot(linspace(0,2,length(x)),x);
title("sinal sintetizado - Triangular")
xlabel("t(s)")
ylabel("Sinal")


subplot(3,1,2);
plot(Fs/(length(x)+1)*(0:length(x)-1), abs(fourier)/max(abs(fourier)),"LineWidth",3)
title("Resposta em frequência (Triangular) - Magnitude")
xlabel("freq (Hz)")
ylabel("|fft(X)|")
axis([0 Fs 0 1]);

subplot(3,1,3);
plot(Fs/(length(x)+1)*(0:length(x)-1), angle(fourier)*180/pi);
title("Resposta em frequência (Triangular) - Fase")
xlabel("freq (Hz)")
ylabel("Angulo (°)")
axis([0 Fs 0 max(angle(fourier)*180/pi)]);