clear;


pid1 = pid(5,8,0.1);
pid2 = pid(5,10,0.06);
pid3 = pid(5,13,0.1);
pid4 = pid(5,10,0.3);


%p control of 2nd order system
func1 = tf(100,[1,10,100]);
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
figure(1)
step(fb_func1)
figure(2)
step(p1);hold on, step(p2);holdon, step(p3);holdon, step(p4)
title('PID control for varying kd and ki at kp=5');
legend({'kd=8,ki=0.1','kd=10,ki=0.06','kd=13,ki=0.1','kd=10,ki=0.1'});

% PID controller Matlab defined values
[tf_pid,param_pid] = pidtune(func1,'PID');
pid_sysdef = feedback(tf_pid*func1,[1]);
stepinfo(pid_sysdef);

disp('PID controller details');
disp(tf_pid); %TF of PI controller
disp(param_pid);

figure(3)
step(fb_func1,[1],'−b');
hold on
step(feedback(tf_pid*func1,[1]),'−r');
title('System defined PID control');
legend({'Closed Loop Syste','PID Comtrol'})