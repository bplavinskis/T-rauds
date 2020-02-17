%% Ievads simboliskajā matemātikā
% Piemērs
sysm a11 a12 a21 a22 b11 b12 b21 b22
{Undefined function or variable 'sysm'.
} 
syms a11 a12 a21 a22 b11 b12 b21 b22
A = [a11 a12; a21 a22];
B = [b11 b12; b21 b22];
A
 
A =
 
[ a11, a12]
[ a21, a22]
 
C = A*B
 
C =
 
[ a11*b11 + a12*b21, a11*b12 + a12*b22]
[ a21*b11 + a22*b21, a21*b12 + a22*b22]
 
D = A.*B
 
D =
 
[ a11*b11, a12*b12]
[ a21*b21, a22*b22]
 
%% Kā definet simbolisko mainīgo
% 1.
% definēsim X Y kā simboliskus mainīgos izmantojot "sym"
x = sym('x');
y = sym('y');
%% atradīsim kvadrātsakni no x^2
y = x^2;
z = sqrt(y)
 
z =
 
(x^2)^(1/2)
 
x = sym('x','positive');
y = x^2;
z = sqrt(y)
 
z =
 
x
 
%% Kā definet simbolisko mainīgo - 2
syms x y
% šajā rindā esam definējuši x,y, kā simboliskos mainīgos
syms x y positive
% šajā rindā esam definējuši x,y, kā simboliskos mainīgos kas ir lielāki par nulli
syms a11 a12 a21 a22 
A = [a11 a12; a21 a22];
A'
 
ans =
 
[ conj(a11), conj(a21)]
[ conj(a12), conj(a22)]
 
%% pateiksim ka matricas elementi nav kompleksi/ir reāli skaitļi
syms a11 a12 a21 a22 real
A = [a11 a12; a21 a22];
A'
 
ans =
 
[ a11, a21]
[ a12, a22]
 
%% Kā definet simbolisko mainīgo - 3
A = sym('a',[2 3])
 
A =
 
[ a1_1, a1_2, a1_3]
[ a2_1, a2_2, a2_3]
 
A = sym('a%d%d',[2 3])
 
A =
 
[ a11, a12, a13]
[ a21, a22, a23]
 
A = sym('a_%d_%d',[2 3])
 
A =
 
[ a_1_1, a_1_2, a_1_3]
[ a_2_1, a_2_2, a_2_3]
 
%% Atvasināšana
sysm x
{Undefined function or variable 'sysm'.
} 
syms x
y = x^2;
% atvasināšanu veiksim ar funkciju diff
diff(y)
 
ans =
 
2*x
 
%% parciālais atvasinājums
syms x y
z = 3*x^5+7*y^6;
diff(z,x);
diff(z,x)
 
ans =
 
15*x^4
 
diff(z,y)
 
ans =
 
42*y^5
 
%% Integrēšana
syms x
y = x^3;
int(y,x)
 
ans =
 
x^4/4
 
int(x^3,x)
 
ans =
 
x^4/4
 
%% Noteiktais integrālis
syms x
int(x,x,0,3)
 
ans =
 
9/2
 
double(int(x,x,0,3))

ans =

    4.5000

%% stbilde nev simbolis
%% Robežas
syms x
limit(1/(x-1),x,1,'left')
 
ans =
 
-Inf
 
% izteiksme 1/(x-1), ja x tiecas uz 1 no kreisās puses
limit(1/(x-1),x,1,'right')
 
ans =
 
Inf
 
% izteiksme 1/(x-1), ja x tiecas uz 1 no labās puses
%% Vienādojumu risināšana
syms x
% risināsim vienādojumu X^2-7x+12=0, (saknēm jābūt 3 un 4)
solve(x^2-7*x+12==0,x)
 
ans =
 
 3
 4
 
%% Vienādojumu sistēmu risināšana
syms x y z
atb = solve(x+y+z==10,x-y+z==4,x+y-z==0)

atb = 

  <a href="matlab:helpPopup struct" style="font-weight:bold">struct</a> with fields:

    x: [1×1 sym]
    y: [1×1 sym]
    z: [1×1 sym]

atb.x
 
ans =
 
2
 
atb.y
 
ans =
 
3
 
atb.z
 
ans =
 
5
 
%% Simboliskie mainīgie
%% Simboliskie konstantes
a = vpa(2)
 
a =
 
2.0
 
b = vpa(pi)
 
b =
 
3.1415926535897932384626433832795
 
c = vpa(sqrt(2))
 
c =
 
1.4142135623730950488016887242097
 
d = sqrt(a)
 
d =
 
1.4142135623730950488016887242097
 
% zīmju skaitu mainīšana
digits
 
Digits = 32
 
digits(42)
a = vpa(pi)
 
a =
 
3.14159265358979323846264338327950288419717
 
% vpa = Variable precision aritmetic
%% Rezultātu vienkāršošana
syms x 
y = 1/((x-1)*(x-2));
diff(y)
 
ans =
 
- 1/((x - 1)*(x - 2)^2) - 1/((x - 1)^2*(x - 2))
 
int(y)
 
ans =
 
log(1 - 1/(x - 1))
 
y = (x-4)*(x-5)/((x-1)*(X-2));
{Undefined function or variable 'X'.
} 
y = (x-4)*(x-5)/((x-1)*(x-2));
y_atv = diff(y)
 
y_atv =
 
(x - 4)/((x - 1)*(x - 2)) + (x - 5)/((x - 1)*(x - 2)) - ((x - 4)*(x - 5))/((x - 1)*(x - 2)^2) - ((x - 4)*(x - 5))/((x - 1)^2*(x - 2))
 
%% Mēģināsim vienkāršot:
simplify(y_atv)
 
ans =
 
(6*(x^2 - 6*x + 7))/(x^2 - 3*x + 2)^2
 
simpl
{Undefined function or variable 'simpl'.
} 
simlp
{Not enough input arguments.

Error in <a href="matlab:matlab.internal.language.introspective.errorDocCallback('simlp', '/usr/local/MATLAB/R2018a/toolbox/simulink/simulink/simlp.m', 47)" style="font-weight:bold">simlp</a> (<a href="matlab: opentoline('/usr/local/MATLAB/R2018a/toolbox/simulink/simulink/simlp.m',47,0)">line 47</a>)
[ncstr,nvars]=size(A);
} 
% citi vienkāršojumi:
syms x
y = (x-3)*(x-4);
y
 
y =
 
(x - 3)*(x - 4)
 
expand(y)
 
ans =
 
x^2 - 7*x + 12
 
atb = expand(y);
factor(atb)
 
ans =
 
[ x - 3, x - 4]
 
horner(atb)
 
ans =
 
x*(x - 7) + 12
 
%% Rezultatu "skaista" attēlošana
y = (x-4)*(x-5)/((x-1)*(x-2));
pretty(y)
(x - 4) (x - 5)
---------------
(x - 1) (x - 2)

%% Ko darīt ar rezultatiem 
% Iedomāsimies 
% dots:
y = (x-4)*(x-5)/((x-1)*(x-2));
% uzdevums: atrast atvasinājumu, un uzzīmet to ar funkciju plot
%% Risinājums:
%! 1.definesim simboliskus mainīgus
syms x
y = (x-4)*(x-5)/((x-1)*(x-2));
%% 2.atvasināsim
y_atv = diff(y)
 
y_atv =
 
(x - 4)/((x - 1)*(x - 2)) + (x - 5)/((x - 1)*(x - 2)) - ((x - 4)*(x - 5))/((x - 1)*(x - 2)^2) - ((x - 4)*(x - 5))/((x - 1)^2*(x - 2))
 
y_atv = simplify(diff(y))
 
y_atv =
 
(6*(x^2 - 6*x + 7))/(x^2 - 3*x + 2)^2
 
%% 3.Izteiksmes vektorizācija
% punktiņu ielikšana pirms *
y_v = vectorize(y)

y_v =

    '((x - 4).*(x - 5))./((x - 1).*(x - 2))'

y_atv_v = vectorize(y_atv)

y_atv_v =

    '(6.*(x.^2 - 6.*x + 7))./(x.^2 - 3.*x + 2).^2'

%% 4.saformēsim x kā vektoru
% x intervāls būs dots uzdevumā
x = [-2:0.01:2-0.01];
% x pieder intervālam [-2;2)
%% 5.ieliksim x - aprēķināsim y
% 1.risinājums copy-paste
y_n = ((x - 4).*(x - 5))./((x - 1).*(x - 2));
% 2.resinājums izmantojot eval
% eval - interpretatora funkcija
y_n = eval(y_n);
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('eval')" style="font-weight:bold">eval</a>
Must be a string scalar or character vector.
} 
y_n = eval(y_v);
y_atv_n = eval(y_atv_v);
%% 6.uzzīmēsim
plot(x,y_n,x,y_atv_n)
ylim([-100 100])
%% 7.grafiku anotācija
% izteiksmes "skaistā" attēlošana -2
y_ltx = latex(y)

y_ltx =

    '\frac{\left(x-4\right)\,\left(x-5\right)}{\left(x-1\right)\,\left(x-2\right)}'

y_atv_ltx = latex(y_atv)

y_atv_ltx =

    '\frac{6\,\left(x^2-6\,x+7\right)}{{\left(x^2-3\,x+2\right)}^2}'

h = legend(['$',y_ltx,'$'],['$',y_atv_ltx,'$']);
[Warning: Error updating Legend.

 String scalar or character vector must have valid interpreter syntax:
 $\frac{\left(x-4\right)\,\left(x-5\right)}{\left(x-1\right)\,\left(x-2\right)}$] 
[Warning: Error updating Legend.

 String scalar or character vector must have valid interpreter syntax:
 $\frac{6\,\left(x^2-6\,x+7\right)}{{\left(x^2-3\,x+2\right)}^2}$
] 
set(h,'Interpreter','Latex')
diary off
