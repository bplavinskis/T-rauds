function lisazu_fun(f1,f2)
% Funkcija, kas uzzīmē Lisažu figūras (0tā laboratorijas nodarbība - 27.01.2020)
% Call:
% lisazu_fun(f1,f2)
%
%Bruno P.
% 27.01.2020
t = 0:0.01:1;
%f1 = 1; f2 = 1;
for faze = 0:pi/100:2*pi
    x = cos(2*pi*f1*t+faze);
    y = sin(2*pi*f2*t);
    plot(x,y)
    pause(0.1)
end
shg