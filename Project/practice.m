clc; clear; close all;
figure('name','Packet Error Rate vs SnR')
%% Paper: On the Throughput and Optimal Packet Length (Slow Rayleigh Fading)

snrdB = 0:1:30;

snrDec = 10.^(snrdB/10);

% Paremeters

n = 600; % packet length

a = 1/2; c = 1/2; % for FSK
eg = 0.577; % Euler Gamma

avgPER1 = 1 - exp(-(log(n) + eg + log(a))./(c*snrDec));

plot(snrdB, avgPER1, 'ro--');

a = 1/2; c = 1; % for dpsk
avgPER2 = 1 - exp(-(log(n) + eg + log(a))./(c*snrDec));
hold on;
plot(snrdB, avgPER2, 'bx--');

title('Packet Error Rate vs SnR');

xlabel('SnR in dB');

ylabel('Packet Error Rate');
grid on;

legend on;
legend({'FSK','DPSK'},'FontSize',12,'TextColor','blue');



%% Throughput and Optimal Packet Length Analysis
Nbar = 1./(1 - avgPER1);


Nextra = 100;
tb = 1e-6;

Tf = tb*(n + Nextra);


throughput1 = (n.*(1-avgPER1))/Tf;

figure('name','Throughput');

plot(snrdB,throughput1,'ro--');
title('SnR vs Throughput');
xlabel('Snr in dB');
ylabel('Throughput / bps');
grid on;
hold on;
throughput2 = (n.*(1-avgPER2))/Tf;
plot(snrdB,throughput2,'bx--');

legend on;
legend({'FSK','DPSK'},'FontSize',12,'TextColor','blue');

