clc; clear all; close all;
tom = 277.18;
Fs = tom * 100;
alpha = 0.995; %Decaimento
tempo = 2; %segundos

% Calcula o tamanho do buffer em amostras
buffer_size = 100;

% Inicializa o buffer com valores aleatórios
buffer = rand(1, buffer_size);

plot(buffer);
%%
% Variáveis para o loop
output = zeros(1, buffer_size);
read_index = 1;

% Loop principal
for i = 1:length(output)
    output(i) = (-1)^i*buffer(read_index);
    buffer(read_index) = ((buffer(read_index) + buffer(mod(read_index, buffer_size) + 1)) * alpha / 2);
    read_index = mod(read_index, buffer_size) + 1;
end

for i = 101:100:(Fs*tempo-100)
    for j = 0:100
        output(i + j) = alpha^(i/100) * output(j+1);
    end
end

plot(output);

Y = fft(output, Fs);

plot(abs(Y));
sound(output, Fs);