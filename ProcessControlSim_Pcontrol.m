clr;
clear;
pkg load control;



p_contr1 = pid(2);
p_contr2 = pid(3);
p_contr3 = pid(8);
p_contr4 = pid(15);


%p control of 2nd order system
func1 = tf(100,[1,10,100]);
fb_func1 = feedback(func1,[1]);
stepinfo(fb_func1);
p1 = feedback(func1*p_contr1,[1]);
p2 = feedback(func1*p_contr2,[1]);
stepinfo(p2);
p3 = feedback(func1*p_contr3,[1]);
p4 = feedback(func1*p_contr4,[1]);


figure(1)
step(fb_func1,'−m');
hold on
step(p1,'−r');
hold on
step(p2,'−b');
hold on
step(p3,'−g');
hold on
step(p4,'−c');
legend({'Closed loop (without pcontrol)','kp=2','kp=3','kp=8','kp=15'})