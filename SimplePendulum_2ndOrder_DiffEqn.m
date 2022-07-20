clc;
clear;
clear;
t = 0.05;
n = 20;
tp = 0:t:n;
x_0 = [pi/3,0];

func = @(t,x)[x(2,1);-(9.8/2)*sin(x(1,1))];
[time,y] = ode45(func,tp,x_0);


plot(time,y(:,1),'r')

title('x')
grid 
hold on 
plot(time,y(:,2),'b')
xlabel('Time in seconds'); 
legend({'displacement in x','derivative in x'});