clc; close all;clear all;

L = 3;
alpha = 0.7;

b = zeros(1,L+1);
a = zeros(1,L+1);

b(1) = 1;
a(1) = 1;
a(L+1) = -alpha;
figure();
impz(b,a,10);

% sys = tf(b, a);
% 
% figure();
% pzmap(sys);
% 
% figure();
% freqz(b, a);
% 
% [h, w] = freqz(b, a, 'whole', 1001);
% 
% figure();
% plot(w/(pi*2*1000),20*log10(abs(h)))
% ax = gca;
% ax.YLim = [-5 12];
% xlabel('Frequência (kHz)')
% ylabel('Magnitude (dB)')
% 
% figure();
% plot(w/(pi*2*1000),angle(h)*180/pi);
% xlabel('Frequência (kHz)')
% ylabel('Fase (rad)')