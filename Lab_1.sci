//ex 1.1
//first question
x=1:4;
//v=[x(1) + 1, x(2) +1, x(3) + 1, x(4) + 1];
v=x+1;
disp(v);
//second question
x_2=1:4;
y_2=5:8;
v_2=x_2 .* y_2; //element wise
disp(v_2);
//third question
parameter= linspace(0, %pi, 10);
v_3 = sin(parameter);
disp(v_3);
//ex1.2
function y=xa(t)
    y=3*sin(100*%pi*t)
endfunction
t = linspace(0, 0.1, 500);
ya=xa(t);

Fs = 300;
n=0:29;
tn= n ./ Fs;

function y=xd(n);
    y=3*sin((%pi/3)*n);
endfunction
yn = xd(n);

delta = 0.1;
yq=delta * fix(yn ./ delta);

subplot(3,1,1);
plot(t, ya);
xtitle("Analog signal xa(t)");
subplot(3,1,2);
plot(tn, yn, "*r");
xtitle("Discrete signal xd(n)");
subplot(3,1,3);
plot(tn, yq, "*r");
xtitle("Quantized signal xq(n)");
