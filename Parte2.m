clc; clear all; close all;

tons = {'C3', 'D3', 'E3', 'F3', 'G3', 'A3', 'B3'};
Frequencias_Tons = {262, 294, 330, 349, 392, 440, 494};
for int= 1:7
    tom = Frequencias_Tons{int};
    Fs = tom * 100;
    alpha = 0.995; %Decaimento
    tempo = 2; %segundos

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
    
    for i = 101:100:(Fs*tempo-100)
        for j = 0:100
            output(i + j) = alpha^(i/100) * output(j+1);clc; clear all; close all;

tons = {'C3', 'D3', 'E3', 'F3', 'G3', 'A3', 'B3'};
Frequencias_Tons = {262, 294, 330, 349, 392, 440, 494};

salvar = 7;

tom = Frequencias_Tons{salvar};
Fs = tom * 100;
alpha = 0.995; %Decaimento
tempo = 2; %segundos

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

for i = 101:100:(Fs*tempo-100)
    for j = 0:100
        output(i + j) = alpha^(i/100) * output(j+1);
    end
end

% Y = fft(output, Fs);
%
% plot(abs(Y));
%soundsc(output, Fs)

filename = [tons{salvar}, '.wav'];
audiowrite(filename, output, Fs);

        end
    end
    
    % Y = fft(output, Fs);
    % 
    % plot(abs(Y));
    soundsc(output, Fs);pause(tempo);
    
end