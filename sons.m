clc; clear all; close all;

% Carregar o arquivo de áudio
[y, Fs] = audioread('result_quadrada.wav');

plot(y);


% Reproduzir o áudio
%sound(y, Fs);