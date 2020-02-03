%-- 02/03/2020 08:25:13 AM --%
mkdir lab1
cd lab1
diary lab1_diary.m
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
% ...
V = -1:0.01:3.2;
V = min(Vm):0.01:max(Vm);
V = linspace(min(Vm),max(Vm),100);
% liekam x mūsu izteiksmē
I = C(1)*V.^2+C(2)*V+c(3);
I = C(1)*V.^2+C(2)*V+C(3);
plot(Vm,Im,'-o',V,I)
plot(Vm,Im,'o',V,I)
% atkārto to pašu tikai ar 3. kārtas polinomu
C = polyfit(Vm,Im,3)
I = C(1)*V.^3+C(2)*V.^2+C(3)*V+C(4);
plot(Vm,Im,'o',V,I)
% to pašu var izdarīt šādi:
C = polyfit(Vm,Im,3)
% izmantosim polyval funkciju, kas aprēķinās polinoma vērtības
I = polyval(C,V);
% sintakse ir y = polyval(C,x);
plot(Vm,Im,'o',V,I)
% tagad atkārto ar 4.kārtas polinomu
C = polyfit(Vm,Im,4)
I = polyval(C,V);
plot(Vm,Im,'o',V,I)
% gadījumu kad pielaikotā polinoma kārta ir vienāda ar (N-1), kur N - punktu skaits,
% sauc par polinomiālo interpolāciju (polinoms iet tieši caur mērijuma punktiem)
% bet citus gadījumus sauc par polinoma aproksimāciju (tad polinoms un mērijuma punkti var nesakrist)
% Uzdevums atkārtots 1. kārtai:
C = polyfit(Vm,Im,1)
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
% ir funkcija kas sasummē vektoru
A = [1 2 3 4 5];
sum(A)
sum(Im)
% vidējā vērtība būtu
Ivid = sum(Im)/5
% tas būtu tas, ko bija jāatrod
sum(Im,1)
sum(Im,2)
% otrais arguments norāda virzienu kā summēt
% 1 - summē elementus katrā kolonnā (arī noklusētā)
% 2 - summē elementus katrā rindā
Ivid = mean(Im)
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
plot(Vm,Im,'o',V,I,'-',Vm,Ivid,'*')
plot(Vm,Im','o',V,I,'-',Vm,Ivid,'*')
Inovirze = std(Im)
errorbar(Vm,Ivid,Inovirze)
errorbar(Vm,Ivid,Inovirze,'.')
hold on
plot(V,I)
hold off
xlable('U,V')
xlabel('U,V')
ylable('I,mA')
ylabel('I,mA')
title('Strāvas atkarība no sprieguma')
legend('eksperimentālie dati','pielaikotais polinoms')
grid
ls
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
[x,y] = ginput(10)
hold on , plot(x,y,'o')
holf off
hold off
diary off
hold on , plot(x,y,'o')
