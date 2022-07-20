
clc;
clear;

w_n = 5;
s = tf('s');
zeta1 = 0.1;
trans_func1 = tf(25,[1 2*5*zeta1 25]);
zeta2 = 0.3;
trans_func2 = tf(25,[1 2*5*zeta2 25]);
zeta3 = 0.5;
trans_func3 = tf(25,[1 2*5*zeta3 25]);
zeta4 = 0.7;
trans_func4 = tf(25,[1 2*5*zeta4 25]);
zeta5 = 1;
trans_func5 = tf(25,[1 2*5*zeta5 25]);
zeta6 = 2;
trans_func6 = tf(25,[1 2*5*zeta6 25]);

figure(1)
step(trans_func1);
hold on
step(trans_func2);
hold on
step(trans_func3);
hold on
step(trans_func4);
hold on
step(trans_func5);
hold on
step(trans_func6);
legend('Zeta = 0.1','Zeta = 0.3','Zeta = 0.5','Zeta = 0.7','Zeta = 1','Zeta = 2');

