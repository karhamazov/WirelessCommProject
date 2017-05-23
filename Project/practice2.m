clc; clear; close all;

%% Paper: On the Throughput and Optimal Packet Length (Slow Rayleigh Fading)

snrdB = 12;
snrDec = 10.^(snrdB/10);

% Paremeters

n = 100:100:2800; % packet length

a = 1/2; c = 1/2; % for FSK
eg = 0.577; % Euler Gamma

avgPER1 = 1 - exp(-(log(n) + eg + log(a))./(c*snrDec));

a = 1/2; c = 1; % for dpsk
avgPER2 = 1 - exp(-(log(n) + eg + log(a))./(c*snrDec));



%% Throughput and Optimal Packet Length Analysis
Nbar = 1./(1 - avgPER1);


Nextra = 100;
tb = 1e-6;



throughput1 = [];
throughput2 = [];
for i = 1:length(n);
    avgPER1 = 1 - exp(-(log(n(i)) + eg + log(1/2))./(0.5*snrDec));
    avgPER2 = 1 - exp(-(log(n(i)) + eg + log(1/2))./(1*snrDec));
    Tf = tb*(n(i) + Nextra);
    
    throughput1(end + 1) = (n(i)*(1-avgPER1))/Tf;
    throughput2(end + 1) = (n(i)*(1-avgPER2))/Tf;
end


figure('name','Throughput 2');

plot(n,throughput1);
title('PacketLength vs ThroughPut at 12 dB SnR');

xlabel('PacketLength in symbols');

ylabel('Throughput / bps');

grid on;
hold on;

plot(n,throughput2);

legend on;
legend({'FSK','DPSK'},'FontSize',12,'TextColor','blue');

