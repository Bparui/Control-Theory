%%routh stabiliity criteria
clear;
clc; 
close all;

CharEqn = input('Enter Characteristic equation array [an an-1...a0]: ');
CharLen = length(CharEqn);

i = mod(CharLen,2);
if i==0
    % Routh matrix in case of even 
    a=zeros(1,(CharLen/2));
    b=zeros(1,(CharLen/2));
    for i=1:(CharLen/2)
        b(i)=CharEqn(2*i);
        a(i)=CharEqn((2*i)-1);
    end
else
    % Routh matrix in case of odd
    newMatrix=[CharEqn 0];
    a=zeros(1,((CharLen+1)/2));b=[zeros(1,((CharLen-1)/2)),0];
    for i=1:((CharLen+1)/2)
        b(i)=newMatrix(2*i);
        a(i)=newMatrix((2*i)-1);
        
    end
end
% Remaining rows
CharLen1=length(a);
RouthMat=zeros(CharLen,CharLen1);
epsilon = 0.0001;
RouthMat(1,:)=a;
RouthMat(2,:)=b;
for i=3:CharLen
    %In case all rows are zero
    if RouthMat(i-1,:) == 0
        order = (CharLen - i);
        c11 = 0;
        c22 = 1;
        for j = 1:CharLen1 - 1
            RouthMat(i-1,j) = (order - c11) * RouthMat(i-2,c22);
            c22 = c22 + 1;
            c11 = c11 + 2;
        end
    end
    %  compute each element of the table
    for j=1:CharLen1-1
        RouthMat(i,j)=-(1/RouthMat(i-1,1))*det([RouthMat((i-2),1) RouthMat((i-2),(j+1));RouthMat((i-1),1) RouthMat((i-1),(j+1))]);
    end
    %Incase 0 in first column
     if RouthMat(i,1) == 0
        RouthMat(i,1) = epsilon;
    end
    
end
disp('Calculated Routh Matrix is :')
disp(RouthMat)
% check the stablity of system
if RouthMat(:,1)>0
    disp('System is found to be Stable')
else
    disp('System is found to be Unstable');
end