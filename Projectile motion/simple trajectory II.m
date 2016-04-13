% -------------------- Simula��o de Objetos Abandonados ------------------- 
% 
% Rela��es Importantes:
%       v = vo + at
%       s = so + vot + at^2/2
% 

close all, clear all

addpath('functions');

% -------------------------- Parametros Iniciais --------------------------
g = -9.809;      % [m/s^2]   Acelera��o da gravidade

ho = input('Altura Inicial: ');       % [m]       ALtura inicial
vo = input('Velocidade Inicial: ');   % [m/s]     Velocidade Inicial

syms t;
t = bhaskara(g/2, vo, ho);

array_t = 0:0.1:t;                              % Vetor de tempo
array_h = ho + vo.*array_t + g.*array_t.^2/2;   % Vetor contem a altura
array_v = vo + g.*array_t;                      % Vetor contem a velocidade

figure(1);
for i=1:length(array_t)
    
      
    subplot(3,3,[1 2 4 5 7 8]);
    plot(0, array_h(i), 'k o');
    axis([-1 1 min(array_h) max(array_h)]);
    title(['LAN�AMENTO DE PROJ�TIL ---- Tempo de simula��o: ' num2str(array_t(i),2) ' s']);
    drawnow;
    
    hold on
    subplot(3,3,3);
    plot(array_t(i), array_h(i), 'b .','markers',12);
    axis([min(array_t) max(array_t) min(array_h) max(array_h)]);
    title('Posi��o');
    drawnow;
    
    hold on
    subplot(3,3,6);
    plot(array_t(i), array_v(i), 'b .','markers',12);
    axis([min(array_t) max(array_t) min(array_v) max(array_v)]);
    title('Velocidade');
    drawnow;
    
    hold on
    subplot(3,3,9);
    plot(array_t(i), g, 'b .','markers',12);
    axis([min(array_t) max(array_t) -10 10]);
    title('Acelera��o');
    drawnow;
    hold on
    pause(1/60);
end
