clc;
clear;

%oth order

s = tf('s');
func = (8*s)/s;
step(func);
title("0th order step response");

%1st order
R1 = 5;
R2 = 10;
R3 = 15;
C = 50*1e-6;
func1 = tf(1, [R1*C,1]);
func2 = tf(1, [R2*C,1]);
func3 = tf(1, [R3*C,1]);
figure(1)
hold on
step(func1,'−b');
hold on
step(func2,'−r');
hold on
step(func3,'−m');
legend({'R = 5hms','R = 10ohms','R = 15ohms'});

figure(2)
step(func2,'−r');

 %2nd order
R1 = 5;
R2 = 10;
R3 = 15;
C = 50*1e-6;
L = 10*1e-3;
func1 = tf(1/(L*C), [1,R1/L,1/(L*C)]);
func2 = tf(1/(L*C), [1,R2/L,1/(L*C)]);
func3 = tf(1/(L*C), [1,R3/L,1/(L*C)]);
figure(3)
step(func1,'−b');
hold on

step(func2,'−r');
hold on
step(func3,'−m');
legend({'R = 5hms','R = 10ohms','R = 15ohms'});
figure(4)
step(func2,'−r');