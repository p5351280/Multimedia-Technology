clear;
[y, fs] = audioread('hz.m4a');
y = y(:, 1);
time = (1:length(y)) / fs;
figure(1);
plot(time, y);
title('time domain');

figure(2);
spectrogram(y, 1024, 1000, [], fs, 'yaxis');
title('spectrogram');

s = abs(fft(y));
n = length(s);
xshift = (-n/2:n/2-1)*(fs/n);
s = fftshift(s);
figure(3);
plot(xshift, s);
title('frequency domain');