## Simple plot

## Line plot of a damped oscilation with a modified line color
## and line width. 

phi = linspace (0, 8*pi);
plot (phi, exp (-phi/(2*pi)) .* sin (phi), "LineWidth", 2);
title ("Damped Oscilation");
xlabel ("phi")
grid on
