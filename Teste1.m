clc; clear all; close all;

Fs = 493.9 * 100;
alpha = 0.995;

% Calcula o tamanho do buffer em amostras
buffer_size = 100;

% Inicializa o buffer com valores aleatórios
buffer = rand(1, buffer_size);

% Aplica um filtro passa-baixa (simplificado)
buffer = buffer * 0.5;

% Variáveis para o loop
output = zeros(1, buffer_size * 2);
read_index = 1;

% Loop principal
for i = 1:length(output)
    output(i) = buffer(read_index);
    buffer(read_index) = (buffer(read_index) + buffer(mod(read_index, buffer_size) + 1)) * alpha / 2;
    read_index = mod(read_index, buffer_size) + 1;
end

for i = 101:100:(Fs*2-100)
    for j = 0:100
        output(i + j) = alpha^(i/100) * output(j+1);
    end
end

sound(output, Fs);