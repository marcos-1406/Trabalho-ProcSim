clc; clear all; close all;

% Carregar o arquivo de áudio
[y, Fs] = audioread('result_aleatoria.wav');

plot(y(1:199));


% Reproduzir o áudio
%sound(y, Fs);