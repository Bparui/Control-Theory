clc;
clear ;


G_s=tf(1.06,[1,3,2,0]);
figure(1)
func_G = feedback(G_s,[1]);
rlocus(func_G);

G_cc = tf([1,0.03],[1,0.003]);


func_Gcomp = feedback(G_s*G_cc,[1]);
figure(2)
rlocus(G_cc*G_s);
figure(3)
step(func_G ,'−r');
hold on
step(func_Gcomp,'−b');
title("Step response of lag compensated and uncompendsated system");
legend({'Uncompensated system','Compensated System'});