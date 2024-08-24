% 
% Função para realizar a Transformada de Fourier de um sinal
% e executa a plotagem no domínio frequência
%
% Autor: Wagner Rambo**
%
% **Engenheiro em Eletrônica, Computadores e Telecomunicações
%
%
% Maio de 2015
%
% Protótipo
%
% [X,freq] = my_fft(x,Fs)
% 
%
% ENTRADAS
% x é o sinal de entrada
% Fs é a frequência de amostragem do sinal
%
% SAÍDAS
%
% X é o módulo do sinal no domínio frequência
% freq é o vetor de frequências
% 

function [X,freq, table1] = my_fft(x,Fs)

N = length(x);                      % variável N recebe o tamanho do vetor x
k = 0:N-1;                          % k é um vetor que vai de zero até N menos 1
T = N/Fs;                           % Vetor de tempo N dividido pela frequência de amostragem
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
plot(freq(1:cutOff),abs(X));        % Plota a transformada de Fourier e o valor de X em módulo
title('Transformada de Fourier Rápida');
xlabel('Frequencia (Hz)');
ylabel('Amplitude');
yaxis([min(abs(X)) max(abs(X))]);
xaxis([freq(1) freq(cutOff)]);

subplot(3,1,3);
plot(freq(1:cutOff), angle(X).*(180/pi),'r');        % Plota a transformada de Fourier da fase
title('Transformada de Fourier Rápida');
xlabel('Frequencia (Hz)');
ylabel('Angulo de fase (°)');
xaxis([freq(1) freq(cutOff)]);
yaxis([min(angle(X).*(180/pi)) max(angle(X).*(180/pi))]);

table1 = table(X', freq(1:cutOff)', abs(X'), angle(X').*(180/pi));
table1.Properties.VariableNames = {'FFT coef', 'Frequency', 'Amplitude', 'Angulo'};
%%disp(table1);


end