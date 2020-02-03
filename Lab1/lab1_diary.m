%% Mērijumu datu apstrāde

% pieņemam ka mums ir mērījumu dati
% mainam priegumu un mēram strāvu
Vm = [-1 0.3 1.5 2.5 3.2];
Im = [1.1 2.2 2.1 3.2 4.7]*1e-3;
plot(Vm,Im,'-o')
% pielaikosim 2. kārtas polinomu
% y = a*x^2+b*x+c
% polifit - meklē polinoma koeficientus
% C = polyfit(x,y,N)
% N - polinoma kārta
C = polyfit(Vm,Im,2)

C =

    0.0002    0.0004    0.0015

% ...
V = -1:0.01:3.2;
V = min(Vm):0.01:max(Vm);
V = linspace(min(Vm),max(Vm),100);
% liekam x mūsu izteiksmē
I = C(1)*V.^2+C(2)*V+c(3);
{Undefined function or variable 'c'.
} 
I = C(1)*V.^2+C(2)*V+C(3);
plot(Vm,Im,'-o',V,I)
plot(Vm,Im,'o',V,I)

% atkārto to pašu tikai ar 3. kārtas polinomu
C = polyfit(Vm,Im,3)

C =

    0.0002   -0.0004    0.0003    0.0021

I = C(1)*V.^3+C(2)*V.^2+C(3)*V+C(4);
plot(Vm,Im,'o',V,I)

% to pašu var izdarīt šādi:
C = polyfit(Vm,Im,3)

C =

    0.0002   -0.0004    0.0003    0.0021

% izmantosim polyval funkciju, kas aprēķinās polinoma vērtības
I = polyval(C,V);
% sintakse ir y = polyval(C,x);
plot(Vm,Im,'o',V,I)

% tagad atkārto ar 4.kārtas polinomu
C = polyfit(Vm,Im,4)

C =

   -0.0001    0.0004   -0.0006    0.0000    0.0022

I = polyval(C,V);
plot(Vm,Im,'o',V,I)
% gadījumu kad pielaikotā polinoma kārta ir vienāda ar (N-1), kur N - punktu skaits,
% sauc par polinomiālo interpolāciju (polinoms iet tieši caur mērijuma punktiem)
% bet citus gadījumus sauc par polinoma aproksimāciju (tad polinoms un mērijuma punkti var nesakrist)

% Uzdevums atkārtots 1. kārtai:
C = polyfit(Vm,Im,1)

C =

    0.0007    0.0017

I = polyval(C,V);
plot(Vm,Im,'o',V,I)


%% Mērijumu sērijas
% piieņemsim ka mēs katrai sprieguma vērtībai strāvu nomērīsim 5 reizes
Vm = [-1 0.3 1.5 2.5 3.2];
Im = [1.1 2.2 2.1 3.2 4.7;
         0.9 1.8 2.6 3.3 4.5;
         1.0 2.0 2.4 3.4 4.3;
         0.8 2.1 2.5 3.2 4.6;
         0.9 1.9 2.3 3.2 4.4]

Im =

    1.1000    2.2000    2.1000    3.2000    4.7000
    0.9000    1.8000    2.6000    3.3000    4.5000
    1.0000    2.0000    2.4000    3.4000    4.3000
    0.8000    2.1000    2.5000    3.2000    4.6000
    0.9000    1.9000    2.3000    3.2000    4.4000

% pamēģināsim to uzzīmēt ar plot
figure
plot(Vm,Im,'-o')
%%
% MatLab zīmē matricas pa kolonnām
% mūsu dati bija ierakstīti pa rindām
% tāpēc ir jātransponē matrica
plot(Vm,Im','-o')
%%
% (pamēģināsim) pielaikosim polinomu
% funkcija polyfit strādā tikai vektoriem
Im

Im =

    1.1000    2.2000    2.1000    3.2000    4.7000
    0.9000    1.8000    2.6000    3.3000    4.5000
    1.0000    2.0000    2.4000    3.4000    4.3000
    0.8000    2.1000    2.5000    3.2000    4.6000
    0.9000    1.9000    2.3000    3.2000    4.4000

% ir funkcija kas sasummē vektoru
A = [1 2 3 4 5];
sum(A)

ans =

    15

sum(Im)

ans =

    4.7000   10.0000   11.9000   16.3000   22.5000

% vidējā vērtība būtu
Ivid = sum(Im)/5

Ivid =

    0.9400    2.0000    2.3800    3.2600    4.5000

% tas būtu tas, ko bija jāatrod
sum(Im,1)

ans =

    4.7000   10.0000   11.9000   16.3000   22.5000

sum(Im,2)

ans =

   13.3000
   13.1000
   13.1000
   13.2000
   12.7000

% otrais arguments norāda virzienu kā summēt
% 1 - summē elementus katrā kolonnā (arī noklusētā)
% 2 - summē elementus katrā rindā
Ivid = mean(Im)

Ivid =

    0.9400    2.0000    2.3800    3.2600    4.5000

% pielaikosim polinomus
C = polyfit(Vm,Ivid,3);
V = linspace(min(Vm),max(Vm),100);
I = polyval(C,V);
% Jūsu uzdevums:
% attēlot grafiku:
% ar 'o' attēlot mērījuma datus 
% ar '*' attēlot vidējo vērtību
% ar '-' attēlot pielaikoto polinomu
plot(Vm,Im,'o',V,I,'-',V,Ivid,'*')
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('plot')" style="font-weight:bold">plot</a>
Vectors must be the same length.
} 
plot(Vm,Im,'o',V,I,'-',Vm,Ivid,'*')
plot(Vm,Im','o',V,I,'-',Vm,Ivid,'*')

Inovirze = std(Im)

Inovirze =

    0.1140    0.1581    0.1924    0.0894    0.1581

errorbar(Vm,Ivid,Inovirze)
errorbar(Vm,Ivid,Inovirze,'.')
hold on
plot(V,I)
hold off
xlable('U,V')
{Undefined function or variable 'xlable'.
} 
xlabel('U,V')
ylable('I,mA')
{Undefined function or variable 'ylable'.
} 
ylabel('I,mA')
title('Strāvas atkarība no sprieguma')
legend('eksperimentālie dati','pielaikotais polinoms')
grid

ls
bilde1.png  bilde2.png	lab1_diary.m

%% Datu nolasīšana no grafika
A = imread('bilde1.png');
B = imread('bilde2.png');
figure(1), image(A)
figure(2), image(B)
figure(2), image([500 800],[0 1],B)
figure(2), image([500 800],[1 0],B)
set(gca,'YDir','normal')

%% varam nolasīt grafiku
% izmantosim funkciju ginput
[x,y] = ginput[10]
 [x,y] = ginput[10]
               ↑
{Error: Invalid expression. When calling a function or indexing a variable, use
parentheses. Otherwise, check for mismatched delimiters.
} 
[x,y] = ginput(10)

x =

  557.6618
  597.2955
  616.2691
  633.5562
  652.5298
  672.3467
  713.2454
  742.3382
  787.8749
  795.0427


y =

    0.0103
    0.2522
    0.6403
    0.9897
    0.6254
    0.2283
    0.0103
    0.0073
    0.0073
    0.0073

hold on , plot(x,y,'o')
holf off
{Undefined function or variable 'holf'.
} 
hold off
diary off
