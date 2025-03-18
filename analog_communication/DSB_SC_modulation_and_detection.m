clc;
clearvars;
t = 0:0.000001:0.001;
Vm = 1;
Vc = 1;
fm = 2000;
fc = 50000;
m_t = Vm*sin(2*pi*fm*t);
subplot(4,1,1);
plot(t,m_t);
title("Modulating Signal");
xlabel('Time');
ylabel('Amplitude');
c_t = Vc*sin(2*pi*fc*t);
subplot(4,1,2);
plot(t,c_t);
title("Carrier Signal")
xlabel('Time');
ylabel('Amplitude');
subplot(4,1,3);
s_t = m_t.*c_t;
hold on;
plot(t,s_t);
plot(t,m_t,"r:");
plot(t,-m_t,"r:");
title("DSB SC Signal")
xlabel('Time');
ylabel('Amplitude');
hold off;

r = s_t.*c_t;
[b a] = butter(1,0.01);
mr = filter(b,a,r);
subplot(4,1,4);
plot(t,mr);
title("Demodulated DSB SC Signal")
xlabel('Time');
ylabel('Amplitude');


