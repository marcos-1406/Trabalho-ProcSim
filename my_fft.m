% 
% Fun��o para realizar a Transformada de Fourier de um sinal
% e executa a plotagem no dom�nio frequ�ncia
%
% Autor: Wagner Rambo**
%
% **Engenheiro em Eletr�nica, Computadores e Telecomunica��es
%
%
% Maio de 2015
%
% Prot�tipo
%
% [X,freq] = my_fft(x,Fs)
% 
%
% ENTRADAS
% x � o sinal de entrada
% Fs � a frequ�ncia de amostragem do sinal
%
% SA�DAS
%
% X � o m�dulo do sinal no dom�nio frequ�ncia
% freq � o vetor de frequ�ncias
% 

function [X,freq, table1] = my_fft(x,Fs)

N = length(x);                      % vari�vel N recebe o tamanho do vetor x
k = 0:N-1;                          % k � um vetor que vai de zero at� N menos 1
T = N/Fs;                           % Vetor de tempo N dividido pela frequ�ncia de amostragem
freq = k/T;
X = fftn(x)/N;                      % X recebe a FFT normalizada do vetor x sobre N
cutOff = ceil(N/2);                 % cutOff ajusta o eixo X
X = X(1:cutOff);


subplot(3,1,1);
plot(x);
title('Sinal');
xlabel('Frequencia (Hz)');
ylabel('Amplitude');
axis([0 Fs min(x) max(x)])

subplot(3,1,2);
plot(freq(1:cutOff),abs(X));        % Plota a transformada de Fourier e o valor de X em m�dulo
title('Transformada de Fourier R�pida');
xlabel('Frequencia (Hz)');
ylabel('Amplitude');
yaxis([min(abs(X)) max(abs(X))]);
xaxis([freq(1) freq(cutOff)]);

subplot(3,1,3);
plot(freq(1:cutOff), angle(X).*(180/pi),'r');        % Plota a transformada de Fourier da fase
title('Transformada de Fourier R�pida');
xlabel('Frequencia (Hz)');
ylabel('Angulo de fase (�)');
xaxis([freq(1) freq(cutOff)]);
yaxis([min(angle(X).*(180/pi)) max(angle(X).*(180/pi))]);

table1 = table(X', freq(1:cutOff)', abs(X'), angle(X').*(180/pi));
table1.Properties.VariableNames = {'FFT coef', 'Frequency', 'Amplitude', 'Angulo'};
%%disp(table1);


end