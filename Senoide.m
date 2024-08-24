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

sound(x, Fs);

[X,freq, table1] = my_fft(x, Fs);

% Y = fft(x);
% 
% figure();
% plot(x);
% 
% Mag = abs(Y);
% Fase = angle(Y);
% 
% 
% figure();
% plot(20*log(Mag)); 
% title("Resposta em frequência (Senóide) - Magnitude")
% xlabel("freq (Hz)")
% ylabel("|fft(X)|")
% 
% figure;
% plot(Fase)
% title("Resposta em frequência (Senóide) - Fase")
% xlabel("freq (Hz)")
% ylabel("Theta (rad)")
