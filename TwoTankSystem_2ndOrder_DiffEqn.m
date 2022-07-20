clc; 
clear; 
close all;

Res1=2; 
Res2=5;
Cap1=1.1;
Cap2=1.4;
h10=10; 
h20=20;
q=5;

t = 0.5;
n = 100;
tp = 0:t:n;
y_0 = [h10; h20];

func = @(t, y)[(1/Cap1)*(q-(y(1)-y(2))/Res1); (1/Cap2)*((y(1)-y(2))/Res1 - y(2)/Res2)];
[time,y] = ode45(func, tp, y_0);

figure(1)
plot(time,y(:,1),'r');
grid
hold on
plot(time,y(:,2),'b');
xlabel('t');
legend({'Movement in h1', 'Movement in h2'});