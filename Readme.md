<h1>Amplitude Modulation And Demodulation</h1>
<h2>Introduction</h2>
The frequency of a RF channel is the frequency of the carrier wave. The carrier wave by itself doesn’t consist of any information. For the transmission of messages, a separate baseband signal is imposed on the carrier wave. This process is known as modulation. Amplitude modulation is one of the three modulation techniques, that is used to increase the base message signal frequency to a higher frequency for proper electronic communication and wave transmission.
<h2>Advantages of modulation</h2>

- For the proper transmission of signals, an antenna of size ≥ λ/4 (where λ is the wavelength of the signal being transmitted) is required. Thus, baseband message signals are modulated with high frequency carrier signals. This modulation process increases the frequency of the signal being transmitted and therefore decreases the wavelength (∵ c= λ*μ), which helps in decreasing the size of the antenna.
 
- High value of power is required for a good transmission to take place. Also, the power radiated by an antenna is directly proportional to (L/ λ) 2. Thus, increase in frequency due to modulation, decreases wavelength and thus a high-power transmission for message signal is achieved.
These are some of the reasons that state the importance of modulation in transmission of message signals.
<h2>Procedure</h2>
<p align = "center">
<img src = "https://github.com/PratikPuri/Amplitude-modulation-and-demodulation-of-waves/blob/feature-readme/images/Flow.jpg"><br>
<b>Basic Transmission Process</b>
</p>
<h2>MATLAB Code</h2>

```
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
```

The above MATLAB code takes message signal wave frequency and amplitude, carrier wave frequency and phase difference between carrier wave and message signal as input.
The graphs shown hereafter in this report have been taken on the following inputs:

```
fmessage signal = 100 HZ
Amplitude = 5
fcarrier signal = 1000 HZ
Phase difference (phi) = 90o
```
- <h3>Modulation</h3>

```
x=a.*sin(w.*t);
y=cos(wn.*t + phi);
z=x.*y;
```

This code is used to impose the message signal x(t) upon carrier wave y(t). The modulated wave is given by z(t).

Plot 1 | Plot 2 | Plot 3
:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/PratikPuri/Amplitude-modulation-and-demodulation-of-waves/blob/feature-readme/images/Plot1.jpg) | ![](https://github.com/PratikPuri/Amplitude-modulation-and-demodulation-of-waves/blob/feature-readme/images/Plot2.jpg) | ![](https://github.com/PratikPuri/Amplitude-modulation-and-demodulation-of-waves/blob/feature-readme/images/Plot3.jpg)

Here the X axis is the time Axis
- <h3>Demodulation</h3>

```
x=a.*sin(w.*t);
y=cos(wn.*t + phi);
z1=x.*y.*y;
```
<p align = "center"><img src = "https://github.com/PratikPuri/Amplitude-modulation-and-demodulation-of-waves/blob/feature-readme/images/Plot4.jpg" width = 400 height = 300 align ="center"></p>

- <h2>Low Pass Filter</h2>
```
lpFilt = designfilt('lowpassfir', 'PassbandFrequency', 0.00001,...
'StopbandFrequency', 0.0003, 'PassbandRipple', 0.5, ...'StopbandAttenuation', 65, 'DesignMethod', 'kaiserwin');
l=filter(lpFilt, z1);
```
<p align = "center"><img src = "https://github.com/PratikPuri/Amplitude-modulation-and-demodulation-of-waves/blob/feature-readme/images/Plot5.jpg" width = 400 height = 300 align ="center"></p>

```
Z1 = x(t)*(cos2(wnt+phi)) = (x(t))/2 + [x(t)*(cos2 (wnt+phi))]/2
```

On Demodulation and filtering the term [x(t)*(cos2 (wnt+phi))]/2 gets removed from the final signal. The desired signal is thus transmitted successfully with its amplitude being half of the input message signal.
<p align = "center"><img src = "https://github.com/PratikPuri/Amplitude-modulation-and-demodulation-of-waves/blob/feature-readme/images/Plot6.jpg" width = 400 height = 300 align ="center">
<br><b>The transmitted signal at different instances(plotted against time as X – axis)</b></p>

---
The MATLAB file Amplitude_Modulation_and_Demodulation(.m) contains the code for amplitude modulation and demodulation.

To find the desired result run the code.

Enter the frequency and amplitude of the message signal, the frequency of the carrier wave and the phase difference between the carrier wave and the message signal after running the code.

Output obtained contains a compilation of five graphs, that include the signal wave, carrier wave, modulated signal wave, demodulated signal wave, filtered demodulated signal wave, all plotted against time respectively.
