
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Itinerario de Eléctrica                          %
%                      Problemas Rég. Transitorio                        %
%                        Universidad de Almería                          %
%                      Curso Académico 2025-2026                         %
%                                                                        %
% Autor: Antonio José González Fernández                                 %
% Autor: Francisco Carreño Rodríguez                                     %
% Grupo: 2                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Ejercicio 1
clc; clear all; close all;     % Limpia la consola, variables y cierra todas las figuras

ts = 0.00001;                  % Paso de muestreo (10 µs)
t = [0:ts:0.004];              % Vector de tiempo de 0 a 4 ms

% Ejecuta la simulación del modelo Simulink 'EJERCICIO_1.slx' en el intervalo t
sim('EJERCICIO_1.slx', t);

% Gráfica de la salida (corriente)
figure
plot(t, Salida)                % Dibuja la variable 'Salida' obtenida del modelo
title('Respuesta de Corriente')
xlabel('Tiempo (s)')
ylabel('Amplitud (A)')
legend('Corriente (A)', 'Location', 'Best', 'FontSize', 10)
ylim([0 0.105])                % Limita el eje Y para ver mejor la respuesta



%% Ejercicio 2
clc; clear all; close all;     % Limpieza de entorno

ts = 0.00001;                  % Paso de muestreo
t = [0:ts:1];                  % Vector de tiempo de 0 a 1 s

% Simulación del modelo 'EJERCICIO_2.slx'
sim('EJERCICIO_2.slx', t);

% Gráfica de la corriente
figure(1)
plot(t, CORRIENTE)
title('Respuesta de Corriente')
xlabel('Tiempo (s)')
ylabel('Amplitud (A)')
legend('Corriente (A)', 'Location', 'Best', 'FontSize', 10)

% Gráfica del voltaje del capacitor
figure(2)
plot(t, VOLTAJE_C)
title('Respuesta de Voltaje')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje (V)', 'Location', 'Best', 'FontSize', 10)



%% Ejercicio 3
clc; clear all; close all;     % Limpieza del entorno

ts = 0.00001;                  % Paso de muestreo
t = 0:ts:2;                    % Vector de tiempo de 0 a 2 segundos

% Crear señal de voltaje de entrada:
% 2V desde t=0 hasta t<1s, y 5V desde t>=1s
fuente = 2 * ones(size(t));    % Inicializa el vector con 2V
fuente(t >= 1) = 5;            % Cambia a 5V después de 1s

% Ejecutar simulación del modelo 'EJERCICIO_3.slx'
sim('EJERCICIO_3.slx', t);

% Crear una figura con tres subgráficas
figure('Name', 'Ejercicio 3 - Señales', 'NumberTitle', 'off');

% Subgráfica 1: Voltaje en el capacitor
subplot(3,1,1)
plot(t, VOLTAJE_C)
title('Respuesta de Voltaje')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje (V)', 'Location', 'Best', 'FontSize', 10)

% Subgráfica 2: Corriente en el inductor
subplot(3,1,2)
plot(t, CORRIENTE_L)
title('Respuesta de Corriente')
xlabel('Tiempo (s)')
ylabel('Corriente (A)')
legend('Corriente (A)', 'Location', 'Best', 'FontSize', 10)

% Subgráfica 3: Señal de entrada aplicada
subplot(3,1,3)
plot(t, fuente)
title('Señal de Voltaje de Entrada')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje de entrada', 'Location', 'Best', 'FontSize', 10)



%% Ejercicio 4
clc; clear all; close all;     % Limpieza del entorno

ts = 0.00001;                  % Paso de muestreo
t = 0:ts:0.1;                    % Vector de tiempo de 0 a 0.1 segundos

% Crear señal de voltaje de entrada:

fuente = ones(size(t));    % Inicializa el vector con 0V
fuente(t >= 0.05) = 10;            % Cambia a 10V después de 0.05s

% Ejecutar simulación del modelo 'EJERCICIO_4.slx'
sim('EJERCICIO_4.slx', t);

% Crear una figura con tres subgráficas
figure('Name', 'Ejercicio 4 - Señales', 'NumberTitle', 'off');

% Subgráfica 1: Voltaje en el capacitor
subplot(3,1,1)
plot(t, VOLTAJE_C)
title('Respuesta de Voltaje')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje (V)', 'Location', 'Best', 'FontSize', 10)

% Subgráfica 2: Corriente en el inductor
subplot(3,1,2)
plot(t, CORRIENTE_L)
title('Respuesta de Corriente')
xlabel('Tiempo (s)')
ylabel('Corriente (A)')
legend('Corriente (A)', 'Location', 'Best', 'FontSize', 10)

% Subgráfica 3: Señal de entrada aplicada
subplot(3,1,3)
plot(t, fuente)
title('Señal de Voltaje de Entrada')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje de entrada', 'Location', 'Best', 'FontSize', 10)



%% Ejercicio 5
clc; clear all; close all;     % Limpieza del entorno

ts = 0.00001;                  % Paso de muestreo
t = 0:ts:0.04;                 % Vector de tiempo de 0 a 0.03 segundos

% Ejecutar simulación del modelo 'EJERCICIO_5.slx'
sim('EJERCICIO_5.slx', t);

% Crear una figura con las dos señales
figure('Name', 'Ejercicio 5 - Corriente y Voltaje de Entrada', 'NumberTitle', 'off');
hold on
% Eje izquierdo: Corriente
yyaxis left
plot(t, CORRIENTE_L, 'b', 'LineWidth', 1.2)
ylabel('Corriente (A)')
ylim([min(CORRIENTE_L)*1.1, max(CORRIENTE_L)*1.1]) % Margen visual
% Eje derecho: Voltaje de la fuente
yyaxis right
plot(t, fuente, 'Color', [0.85 0.33 0.10], 'LineWidth', 1.2) % naranja MATLAB
ylabel('Voltaje (V)')
ylim([min(fuente)*0.9, max(fuente)*1.1])
xlim([-0.0001, 0.04])

% Ejes y leyendas
xlabel('Tiempo (s)')
title('Corriente frente a la Tensión de Entrada')
legend({'Corriente (A)', 'Voltaje de entrada (V)'}, 'Location', 'Best', 'FontSize', 10)

%Para graficar la entrada bonita he usado un step con 0.0001s.