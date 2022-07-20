clc;
clear all; 
close all;
% Block reduction
a_1 = tf([0.5],[1]); 
b_1 = tf([4],[1 3]);
c_1 = tf([-2],[-1 1]);
h_1 = tf([1],[1 10]);

K_p = 1; % Defining Kp
gg = series(K_p,series(feedback(series(a_1,b_1),1),c_1));
system = feedback(gg,h_1)

flaggg = 1;

% Finding the lower limit of Kp for the system to be stable
while flaggg == 1
        system = feedback(series(K_p,series(feedback
                ...(series(a_1,b_1),1),c_1)),h_1);
        poles = pole(system);
        if real(poles(1)) <= 0 && real(poles(2)) <= 0 && real(poles(3)) <= 0
            lower_value = K_p;
            flaggg = 0;
        end
        K_p = K_p + 1;
end

% Finding the upper limit of Kp for the system to be stable
while real(poles(1)) <= 0 && real(poles(2)) <= 0 && real(poles(3)) <= 0
    K_p = K_p + 1;
    system = feedback(series(K_p,series(feedback...
            (series(a_1,b_1),1),c_1)),h_1);
    poles = pole(system);
    
end

disp(lower_value);disp(K_p);
rlocus(system)