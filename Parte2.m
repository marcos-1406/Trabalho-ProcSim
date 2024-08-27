clc; clear all; close all;

tons = {'C3', 'D3', 'E3', 'F3', 'G3', 'A3', 'B3'};
Frequencias_Tons = {262, 294, 330, 349, 392, 440, 494};

for escolha = 1:7

    tom = Frequencias_Tons{escolha};
    Fs = 48000;
    alpha = 0.995; %Decaimento
    tempo = 2; %segundos
    volume = 30; %0 para nenhum volume e 100 para volume máximo

    % Calcula o tamanho do buffer em amostras
    buffer_size = round(Fs / tom);

    % Inicializa o buffer com valores aleatórios
    buffer = rand(1, buffer_size);

    % Variáveis para o loop
    output = zeros(1, round(Fs * tempo));
    read_index = 1;

    % Loop principal
    for i = 1:length(output)
        output(i) = (-1)^i*buffer(read_index);
        buffer(read_index) = ((buffer(read_index) + buffer(mod(read_index, buffer_size) + 1)) * alpha / 2);
        read_index = mod(read_index, buffer_size) + 1;
    end

    % Normaliza o output para estar no intervalo [-1, 1]
    output = output / max(abs(output));
    output = output * volume/100;

    for i = buffer_size+1:buffer_size:(Fs*tempo-buffer_size)
        for j = 0:buffer_size
            output(i + j) = alpha^(i/buffer_size) * output(j+1);
        end
    end

    sound(output, Fs)

    plot(output);
 
end
