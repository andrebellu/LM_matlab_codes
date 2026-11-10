time_series = out.angolo_sim;

tempi = time_series.Time;
angoli = time_series.Data;

x_punta = L*sin(angoli);
y_punta = -L*cos(angoli);


figure(1);

XData = [0 x_punta(1)];
YData = [0 y_punta(1)];

asta = plot(XData, YData, LineWidth=2);

axis equal;
grid on;
xlim([-1.2*L, 1.2*L]);
ylim([-1.2*L, 1.2*L]);
xlabel('Posizione x');
ylabel('Posizione y');
title('Animazione del pendolo');

t_finale = tempi(end);
t_corrente = 0;

tic;

for k = 1:length(tempi)
    asta.XData = [0 x_punta(k)];
    asta.YData = [0 y_punta(k)];
    drawnow;
    
    tempo_target = tempi(k);
    
    tempo_reale = toc; 
    
    ritardo = tempo_target - tempo_reale;
    if ritardo > 0
        pause(ritardo);
    end
end

