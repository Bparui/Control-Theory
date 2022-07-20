
%% Addition of Zeros
w_n = 5;
s = tf('s');
zeta1 = 0.1;
trans_func1 = w_n^2/(s^2 + 2*w_n*zeta1*s + w_n^2);
stepinfo(trans_func1);
trans_func2 = trans_func1*(s+3);
stepinfo(trans_func2);
trans_func3 = trans_func1*(s+2)*(s+3);
stepinfo(trans_func3);
figure(1)
step(trans_func1);
hold on
step(trans_func2);
hold on
step(trans_func3);
legend('No zero1','1 zero','2 zeros');

clc;
clear;
%% Addition of poles
w_n = 5;
s = tf('s');
zeta1 = 0.1;
trans_func1 = w_n^2/(s^2 + 2*w_n*zeta1*s + w_n^2);
stepinfo(trans_func1);
trans_func2 = trans_func1/(s+3);
stepinfo(trans_func2);
trans_func3 = trans_func1/(s^2+5*s+6);
stepinfo(trans_func3);
figure(1)
step(trans_func1);
hold on
step(trans_func2);
hold on
step(trans_func3);
legend('No pole','1 pole(s+3)','2 pole(s+3)*(s+2)');