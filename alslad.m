clc; clear all; close all;
tom = 277.18;
Fs = tom * 100;
alpha = 0.995; %Decaimento
tempo = 2; %segundos

% Calcula o tamanho do buffer em amostras
buffer_size = 100;

% Inicializa o buffer com valores aleatórios
buffer = rand(1, buffer_size);

% Variáveis para o loop
output = zeros(1, buffer_size);
read_index = 1;

% Loop principal
for i = 1:length(output)
    output(i) = (-1)^i*buffer(read_index);
    buffer(read_index) = ((buffer(read_index) + buffer(mod(read_index, buffer_size) + 1)) * alpha / 2);
end