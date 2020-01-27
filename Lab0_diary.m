
	Classroom License -- for classroom instructional use only.

mkdir lab_0
cd lab_0
a = 1

a =

     1

b = 2

b =

     2

c = a+b

c =

     3

A = [1 2; 3 4]

A =

     1     2
     3     4

B = [3 4; 5 6]

B =

     3     4
     5     6

C = A*B

C =

    13    16
    29    36

C = A.*B

C =

     3     8
    15    24

% Uzzīmēsim 2.kārtas polinomu
% y = a*x^2+b*x+c
% polioma koeficientus a, b,c
% saglabāsim vektorā C
C = [2 3 4];
% definēsim x
x = -6:2:6;
% nozīmē: sākuma_elements:solis:beigu_elements
x = -6:2:6

x =

    -6    -4    -2     0     2     4     6

% aprēķināsim y
y = C(1)*x^2+C(2)*x+C(3)
Error using  ^ 
Incorrect dimensions for raising a matrix to a power. Check that the matrix is square and the power is a scalar. To perform
elementwise matrix powers, use '.^'.
 
y = C(1)*x.^2+C(2)*x+C(3)

y =

    58    24     6     4    18    48    94

% zīmēsim grafiku
% zīmē ar plot
% sintakse : plot(x,y)
plot(x,y)
% ko darīt lai nebūtu lauztā līnija
% ir jāsamazina solis
x2 = -6:0.01:6;
y2 = C(1)*x2.^2+C(2)*x2+C(3);
plot(x2,y2)
% Kā uzzīmēt vairākus grafikus
plot(x,y,x2,y2)
% Kā mainīt līnijas izskatu
plot(x,y,'o')
plot(x,y,'g')
plot(x,y,'--')
plot(x,y,'--go')
help plot
 plot   Linear plot. 
    plot(X,Y) plots vector Y versus vector X. If X or Y is a matrix,
    then the vector is plotted versus the rows or columns of the matrix,
    whichever line up.  If X is a scalar and Y is a vector, disconnected
    line objects are created and plotted as discrete points vertically at
    X.
 
    plot(Y) plots the columns of Y versus their index.
    If Y is complex, plot(Y) is equivalent to plot(real(Y),imag(Y)).
    In all other uses of plot, the imaginary part is ignored.
 
    Various line types, plot symbols and colors may be obtained with
    plot(X,Y,S) where S is a character string made from one element
    from any or all the following 3 columns:
 
           b     blue          .     point              -     solid
           g     green         o     circle             :     dotted
           r     red           x     x-mark             -.    dashdot 
           c     cyan          +     plus               --    dashed   
           m     magenta       *     star             (none)  no line
           y     yellow        s     square
           k     black         d     diamond
           w     white         v     triangle (down)
                               ^     triangle (up)
                               <     triangle (left)
                               >     triangle (right)
                               p     pentagram
                               h     hexagram
                          
    For example, plot(X,Y,'c+:') plots a cyan dotted line with a plus 
    at each data point; plot(X,Y,'bd') plots blue diamond at each data 
    point but does not draw any line.
 
    plot(X1,Y1,S1,X2,Y2,S2,X3,Y3,S3,...) combines the plots defined by
    the (X,Y,S) triples, where the X's and Y's are vectors or matrices 
    and the S's are strings.  
 
    For example, plot(X,Y,'y-',X,Y,'go') plots the data twice, with a
    solid yellow line interpolating green circles at the data points.
 
    The plot command, if no color is specified, makes automatic use of
    the colors specified by the axes ColorOrder property.  By default,
    plot cycles through the colors in the ColorOrder property.  For
    monochrome systems, plot cycles over the axes LineStyleOrder property.
 
    Note that RGB colors in the ColorOrder property may differ from
    similarly-named colors in the (X,Y,S) triples.  For example, the 
    second axes ColorOrder property is medium green with RGB [0 .5 0],
    while plot(X,Y,'g') plots a green line with RGB [0 1 0].
 
    If you do not specify a marker type, plot uses no marker. 
    If you do not specify a line style, plot uses a solid line.
 
    plot(AX,...) plots into the axes with handle AX.
 
    plot returns a column vector of handles to lineseries objects, one
    handle per plotted line. 
 
    The X,Y pairs, or X,Y,S triples, can be followed by 
    parameter/value pairs to specify additional properties 
    of the lines. For example, plot(X,Y,'LineWidth',2,'Color',[.6 0 0]) 
    will create a plot with a dark red line width of 2 points.
 
    Example
       x = -pi:pi/10:pi;
       y = tan(sin(x)) - sin(tan(x));
       plot(x,y,'--rs','LineWidth',2,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',10)
 
    See also plottools, semilogx, semilogy, loglog, plotyy, plot3, grid,
    title, xlabel, ylabel, axis, axes, hold, legend, subplot, scatter.

    Reference page for plot
    Other functions named plot

plot(x,y,'.r',x2,y2,'-k')
plot(x,y,'or',x2,y2,'-k')
% Citas grafiskās funkcijas
stem(x,y)
stairs(x,y)
% grafika īpašību maiņa
mans_grafiks(x,y)
mans_grafiks(x2,y2)
close all
% aizver visus grafikus
% Kā zīmēt vairākus grafikus v2
stairs(x,y)
hold on
plot(x2,y2)
stem (x,y)
hold off
% hold on iesaldē asis
% hold off izslēdz režīmu
% Zīmēsim Lisažu figūras
% tālāko kodu rakstīsim Editotā
edit
help lisazu
  Skripts, kas uzzīmē Lisažu figūras (0tā laboratorijas nodarbība - 27.01.2020)

lisazu
lisazu
lisazu
lisazu
lisazu
lisazu
lisazu
lisazu
lisazu_fun(9,9)
lisazu_fun(32,0.12)
lisazu_fun(420,0.12)
lisazu_fun(69,0.12)
lisazu_fun(420,0.69)
lisazu_fun(69,0.42)
lisazu_fun_anim(69,420)
