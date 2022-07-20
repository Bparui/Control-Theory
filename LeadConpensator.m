clc;
clear ;

G_s=tf(10,[1,1,0]);
figure(1)
rlocus(G_s);

G_cc = 0.9*tf([1,1],[1,3]);
%Gc=0.9*(s+1)/(s+3);
figure(2)
rlocus(G_s*G_cc);

func_G = feedback(G_s,[1]);
func_Gcomp = feedback(G_s*G_cc,[1]);
figure(3)
step(func_G,'−r');
hold on
step(func_Gcomp,'−b');
title("Step response of compensated and uncompendsated system");
legend({'Uncompensated system','Compensated System'});