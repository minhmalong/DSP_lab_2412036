// Additional Exercise 1.2
clf();

// (a) N0 = 200
n = 0:399;
x = cos(0.01*%pi*n);

subplot(4,1,1);
plot2d3(n,x);
title("(a) cos(0.01*pi*n), N0 = 200");
xlabel("n");
ylabel("Amplitude");

// (b) N0 = 7
n = 0:13;
x = cos((2*%pi/7)*n);

subplot(4,1,2);
plot2d3(n,x);
title("(b) cos(2*pi*n/7), N0 = 7");
xlabel("n");
ylabel("Amplitude");

// (c) N0 = 2
n = 0:3;
x = cos(3*%pi*n);

subplot(4,1,3);
plot2d3(n,x);
title("(c) cos(3*pi*n), N0 = 2");
xlabel("n");
ylabel("Amplitude");

// (e) N0 = 10
n = 0:19;
x = sin((31*%pi/5)*n);

subplot(4,1,4);
plot2d3(n,x);
title("(e) sin(31*pi*n/5), N0 = 10");
xlabel("n");
ylabel("Amplitude");

// Additional Exercise 1.4

function g = mygcd(a,b)
    while b <> 0
        r = modulo(a,b);
        a = b;
        b = r;
    end
    g = a;
endfunction

// N = 7
N = 7;

disp("N = 7");

for k = 0:N-1
    Np = N / mygcd(k,N);
    mprintf("k = %d, Np = %d\n", k, Np);
end

// N = 16
N = 16;

disp("N = 16");

for k = 0:N-1
    Np = N / mygcd(k,N);
    mprintf("k = %d, Np = %d\n", k, Np);
end

// Additional Exercise 1.7

clf();

Fs = 8000;
n = 0:31;

// F1 = 5 kHz -> alias 3 kHz
F1 = 5000;
x1 = cos(2*%pi*F1/Fs*n);

subplot(2,1,1);
plot2d3(n,x1);
title("F = 5 kHz, Fs = 8 kHz -> alias = 3 kHz");
xlabel("n");
ylabel("Amplitude");

// F2 = 9 kHz -> alias 1 kHz
F2 = 9000;
x2 = cos(2*%pi*F2/Fs*n);

subplot(2,1,2);
plot2d3(n,x2);
title("F = 9 kHz, Fs = 8 kHz -> alias = 1 kHz");
xlabel("n");
ylabel("Amplitude");

// Additional Exercise 1.11

clf();

T = 0.005;
Tp = 0.001;

// Analog input
t = linspace(0,0.04,1000);
xa = 3*cos(100*%pi*t) + 2*sin(250*%pi*t);

// Discrete signal after A/D
n = 0:19;
xn = 3*cos((%pi/2)*n) - 2*sin((3*%pi/4)*n);

// Analog output after D/A
ya = 3*cos(500*%pi*t) - 2*sin(750*%pi*t);

subplot(3,1,1);
plot(t,xa);
title("Input xa(t)");
xlabel("t (s)");
ylabel("Amplitude");

subplot(3,1,2);
plot2d3(n,xn);
title("Discrete signal x(n)");
xlabel("n");
ylabel("Amplitude");

subplot(3,1,3);
plot(t,ya);
title("Output ya(t)");
xlabel("t (s)");
ylabel("Amplitude");

// Additional Exercise 1.15(a)

clf();

Fs = 5000;
F0 = [500 2000 3000 4500];
n = 0:90;

for i = 1:4

    x = sin(2*%pi*F0(i)/Fs*n);

    subplot(4,1,i);
    plot2d3(n,x);

    title("F0 = " + string(F0(i)/1000) + " kHz");
    xlabel("n");
    ylabel("Amplitude");

end

// Additional Exercise 1.15(b)

clf();

Fs = 50000;
F0 = 2000;

n = 0:90;

x = sin(2*%pi*F0/Fs*n);

// Original signal
subplot(2,1,1);
plot2d3(n,x);
title("x(n), F0 = 2 kHz, Fs = 50 kHz");
xlabel("n");
ylabel("Amplitude");

// Take even-numbered samples
m = 0:45;
y = sin(2*%pi*F0/Fs*(2*m));

subplot(2,1,2);
plot2d3(m,y);
title("y(m) = x(2m)");
xlabel("m");
ylabel("Amplitude");

// Additional Exercise 1.16(a)

N = 200;
f0 = 1/50;

n = 0:N-1;
x = sin(2*%pi*f0*n);

levels = [64 128 256];

Px = sum(x.^2) / N;

scf(1);
clf();

for i = 1:3

    L = levels(i);

    delta = 2/L;

    // Truncation
    xq = delta * floor(x ./ delta);

    e = xq - x;

    Pq = sum(e.^2) / N;

    SQNR = 10*log10(Px/Pq);

    mprintf("Truncation: L = %d, SQNR = %f dB\n",L,SQNR);

    // Original
    subplot(3,3,(i-1)*3+1);
    plot2d3(n,x);
    title("x(n), L = " + string(L));
    xlabel("n");
    ylabel("Amplitude");

    // Quantized
    subplot(3,3,(i-1)*3+2);
    plot2d3(n,xq);
    title("xq(n)");
    xlabel("n");
    ylabel("Amplitude");

    // Error
    subplot(3,3,(i-1)*3+3);
    plot2d3(n,e);
    title("e(n)");
    xlabel("n");
    ylabel("Error");

end

// Additional Exercise 1.16(b)

N = 200;
f0 = 1/50;

n = 0:N-1;
x = sin(2*%pi*f0*n);

levels = [64 128 256];

Px = sum(x.^2) / N;

scf(2);
clf();

for i = 1:3

    L = levels(i);

    delta = 2/L;

    // Rounding
    xq = delta * round(x ./ delta);

    e = xq - x;

    Pq = sum(e.^2) / N;

    SQNR = 10*log10(Px/Pq);

    mprintf("Rounding: L = %d, SQNR = %f dB\n",L,SQNR);

    // Original
    subplot(3,3,(i-1)*3+1);
    plot2d3(n,x);
    title("x(n), L = " + string(L));
    xlabel("n");
    ylabel("Amplitude");

    // Quantized
    subplot(3,3,(i-1)*3+2);
    plot2d3(n,xq);
    title("xq(n)");
    xlabel("n");
    ylabel("Amplitude");

    // Error
    subplot(3,3,(i-1)*3+3);
    plot2d3(n,e);
    title("e(n)");
    xlabel("n");
    ylabel("Error");

end
