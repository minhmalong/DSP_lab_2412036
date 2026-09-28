n=-5:5;
msignal=bool2s(n>=0);
plot2d3(n,msignal)

n=-5:5;
msignal=bool2s(n==0);
plot2d3(n, msignal);

//ex4
n=-5:5;
ur = n .* bool2s(n>=0);
plot2d3(n,ur);
xtitle("Unit ramp signal ur(n)","n", "Amplitude");

//ex5
n=-1:1;
x=[1 3 -2];
x_reverse = x($:-1:1);
xe = (x + x_reverse)./2;
xo = (x-x_reverse)./2;
// Plot x(n)
subplot(3,1,1);
plot2d3(n, x);
a = gca();
a.data_bounds = [-1.5,-2.5; 1.5,3.5];
title("Original signal x(n)");
xlabel("n");
ylabel("Amplitude");

subplot(3,1,2);
plot2d3(n, xe);
a = gca();
a.data_bounds = [-1.5,-1; 1.5,3.5];
title("Even component xe(n)");
xlabel("n");
ylabel("Amplitude");

subplot(3,1,3);
plot2d3(n, xo);
a = gca();
a.data_bounds = [-1.5,-2; 1.5,2];
title("Odd component xo(n)");
xlabel("n");
ylabel("Amplitude");

//ex6
n = -1:3;

// Align both signals on the same n-axis
x1 = [0 0 1 3 -2];
x2 = [0 1 2 3 0];
y=x1+x2;
subplot(3,1,1);
plot2d3(n,x1);
a = gca();
a.data_bounds = [-1.5,-2.5; 3.5,3.5];
title("Signal x1(n)");
xlabel("n");
ylabel("Amplitude");

//x2
subplot(3,1,2);
plot2d3(n,x2);
a = gca();
a.data_bounds = [-1.5,-0.5; 3.5,3.5];
title("Signal x2(n)");
xlabel("n");
ylabel("Amplitude");
//x3

subplot(3,1,3);
plot2d3(n,y);
a = gca();
a.data_bounds = [-1.5,-2.5; 3.5,6.5];
title("y(n)=x1(n) + x2(n)");
xlabel("n");
ylabel("Amplitude");

// ex7
clf();

n = -1:3;

// Align both signals on the same n-axis
x1 = [0 0 1 3 -2];
x2 = [0 1 2 3 0];

y = x1 .* x2;

// x1
subplot(3,1,1);
plot2d3(n,x1);
a = gca();
a.data_bounds = [-1.5,-2.5; 3.5,3.5];
title("Signal x1(n)");
xlabel("n");
ylabel("Amplitude");

// x2
subplot(3,1,2);
plot2d3(n,x2);
a = gca();
a.data_bounds = [-1.5,-0.5; 3.5,3.5];
title("Signal x2(n)");
xlabel("n");
ylabel("Amplitude");

// y
subplot(3,1,3);
plot2d3(n,y);
a = gca();
a.data_bounds = [-1.5,-0.5; 3.5,9.5];
title("y(n) = x1(n) .* x2(n)");
xlabel("n");
ylabel("Amplitude");

//ex8
nx = -2:1;
x = [1 -2 3 6];
// ========================
// y1(n) = x(-n)
// ========================
n1 = -nx($:-1:1);
y1 = x($:-1:1);
scf(1);
clf();

// Original x(n)
subplot(2,1,1);
plot2d3(nx, x);

a = gca();
a.data_bounds = [-2.5,-2.5; 1.5,6.5];

title("Original signal x(n)");
xlabel("n");
ylabel("Amplitude");


// y1(n) = x(-n)
subplot(2,1,2);
plot2d3(n1, y1);

a = gca();
a.data_bounds = [-1.5,-2.5; 2.5,6.5];

title("y1(n) = x(-n)");
xlabel("n");
ylabel("Amplitude");


// ========================
// y2(n) = x(n + 3)
// ========================

n2 = nx - 3;
y2 = x;

scf(2);
clf();

subplot(2,1,1);
plot2d3(nx, x);
title("Original signal x(n)");
xlabel("n");
ylabel("Amplitude");

subplot(2,1,2);
plot2d3(n2, y2);
title("y2(n) = x(n + 3)");
xlabel("n");
ylabel("Amplitude");


// ========================
// y3(n) = 2x(-n - 2)
// ========================

n3 = -nx($:-1:1) - 2;
y3 = 2 * x($:-1:1);

scf(3);
clf();

subplot(2,1,1);
plot2d3(nx, x);
title("Original signal x(n)");
xlabel("n");
ylabel("Amplitude");

subplot(2,1,2);
plot2d3(n3, y3);
title("y3(n) = 2x(-n - 2)");
xlabel("n");
ylabel("Amplitude");
