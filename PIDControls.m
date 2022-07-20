clr;
clear all;
pkg load control;

% P control
p_contr1 = pid(2); 
p_contr2 = pid(3);
p_contr3 = pid(8);
p_contr4 = pid(15);
%p control of 2nd order system
func1 = tf(100,[1,10,100])
fb_func1 = feedback(func1,[1]);

p1 = feedback(func1*p_contr1,[1]);
p2 = feedback(func1*p_contr2,[1]);

p3 = feedback(func1*p_contr3,[1]);
p4 = feedback(func1*p_contr4,[1]);

stepinfo(fb_func1)
stepinfo(p1)
stepinfo(p2)
stepinfo(p3)
stepinfo(p4)

% i control
clear;
clear all;

p_contr1 = pid(0,0.8,0); 
p_contr2 = pid(0,5,0);
p_contr3 = pid(0,20,0);
%p control of 2nd order system
func1 = tf(100,[1,10,100]);
fb_func1 = feedback(func1,[1]);

p1 = feedback(func1*p_contr1,[1]);
p2 = feedback(func1*p_contr2,[1]);
p3 = feedback(func1*p_contr3,[1]);

stepinfo(fb_func1)
stepinfo(p1)
stepinfo(p2)
stepinfo(p3)

figure(1)
step(fb_func1,'-m');
legend({'Closed loop (without i control)'});
figure(3)
step(p1,'-r');
hold on
step(p2,'-b');
legend({'ki=0.2','ki=2'});
figure(2)
step(p3,'-g');
legend({'ki=20'});

% d control
clear;

p_contr1 = pid(0,0,0.2); 
p_contr2 = pid(0,0,2);
p_contr3 = pid(0,0,20);
%p control of 2nd order system
func1 = tf(100,[1,10,100]);
fb_func1 = feedback(func1,[1]);

p1 = feedback(func1*p_contr1,[1]);
p2 = feedback(func1*p_contr2,[1]);

p3 = feedback(func1*p_contr3,[1]);

stepinfo(fb_func1)
stepinfo(p1)
stepinfo(p2)
stepinfo(p3)

figure(1)
step(fb_func1,'-m');
hold on
step(p1,'-r');
legend({'Closed loop (without d control)','kp=0.2'});
figure(2)
step(p2,'-b');
hold on
step(p3,'-g');
legend({'kd=2','kd=20'});

% pi
clear;

p_contr1 = pid(5,0.2,0); 
p_contr2 = pid(5,0.02,0);
p_contr3 = pid(5,10,0);
p_contr5 = pid(7,0.2,0);
p_contr4 = pid(3,0.2,0);
%p control of 2nd order system
func1 = tf(100,[1,10,100]);
fb_func1 = feedback(func1,[1]);

p1 = feedback(func1*p_contr1,[1]);
p2 = feedback(func1*p_contr2,[1]);
p4 = feedback(func1*p_contr4,[1]);
p5 = feedback(func1*p_contr5,[1]);
p3 = feedback(func1*p_contr3,[1]);


stepinfo(p1)
stepinfo(p2)
stepinfo(p3)
stepinfo(p4)
stepinfo(p5)
figure(1)
step(fb_func1,'-m');
hold on
step(p1,'-r');
hold on
step(p2,'-b');
hold on 
step(p3,'g');
legend({'Closed loop (without pi control)','kp,ki=5,0.2','kp,ki=5,0.02','kp,ki=5,10'});
figure(2)
step(fb_func1,'-m');
hold on
step(p1,'-r');
hold on
step(p4,'-g');
hold on
step(p5,'-b');
legend({'Closed loop (without pi control)','kp,ki=5,0.2','kp,ki=3,0.2','kp,ki=7,0.2'});

%pid
pid1 = pid(5,8,0.1); 
pid2 = pid(5,10,0.06);
pid3 = pid(5,13,0.1);
pid4 = pid(5,10,0.3);


%p control of 2nd order system
func1 = tf(100,[1,10,100])
fb_func1 = feedback(func1,[1]);
stepinfo(fb_func1)
p1= feedback(func1*pid1,[1]);
stepinfo(p1)
p2= feedback(func1*pid2,[1]);
stepinfo(p2)
p3= feedback(func1*pid3,[1]);
stepinfo(p3)
p4= feedback(func1*pid4,[1]);
stepinfo(p4)