clear;clf;clc;
m=100;
C=4;
D=0.8;
Tt=2;
f1=tf(1,[m D C]);
set(f1,'InputDelay',Tt);
%step(f1);
%figure;
%bode(f1)

b=[1];
a=[m D C];

w=logspace(-2,4,1000)*sqrt(-1);

g=polyval(b,w)./polyval(a,w).*exp(-Tt*w);
subplot(1,1,1);
plot(real(g),imag(g));
return;

mag=20*log10(abs(g));
ang=angle(g);
figure;
subplot(2,1,1);
semilogx(abs(w),mag);
subplot(2,1,2);
semilogx(abs(w),ang);