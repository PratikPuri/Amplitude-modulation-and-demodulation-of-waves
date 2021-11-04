t1='Input the message signal frequency: ';
t2='Input the amplitude of the messgae signal: ';
t3='Input the carrier wave frequency: ';
t4='Input the phase difference between carrier and signal wave(degrees): ';

f=input(t1);
a=input(t2);
fn=input(t3);
phi=input(t4).*(pi./180);

T=1./f;
t=(0:0.0000001:T.*10);
w=2*pi*f;

subplot(5,1,1);
x=a.*sin(w.*t);
plot (t,x)
title("Message Signal Wave: x(t)");

subplot(5,1,2);
wn=2*pi*fn;
y=cos(wn.*t + phi);
plot (t,y)
title("Carrier Wave: y(t)");

subplot(5,1,3);
z=x.*y;
plot (t,z)
title("Modulated Wave: x(t) X y(t)");

subplot(5,1,4);
z1=x.*y.*y;
plot (t,z1)
title("Demodulated Wave: x(t) X y(t) X y(t)");

lpFilt = designfilt('lowpassfir', 'PassbandFrequency', 0.00001,...
'StopbandFrequency', 0.0003, 'PassbandRipple', 0.5, ...
'StopbandAttenuation', 65, 'DesignMethod', 'kaiserwin');

subplot(5,1,5);
l=filter(lpFilt, z1);
plot (t,l);
title("Amplitude Modulated wave passed through a low pass filter");
