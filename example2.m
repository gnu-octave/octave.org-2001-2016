## Histogram plot

## Simple histogram of a normal distributed random number.

x = randn (1e5, 1);
hist (x, 32);
xlabel ("amplitude");
ylabel ("frequency");
title ("Histogram");
