%%this is Matlab Code for Part 1
close all
clear all
clc
%%
%-----------------------part I-----------------------------------%
X = linspace(1,20,20);
Y = linspace(3,18,16);
i=1;
for k= 1:1:20
    if i<7
        if k==X(i)
            PX(k)=1/6;
            i=i+1;
        else
            PX(k)=0;
        end
    else
        PX(k)=0;
    end
end

PY=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    for i= 1:1:20
        for k= 1:1:6
            for l=1:1:6
                for m= 1:1:6
                    if i==k+l+m
                        PY(i)= PY(i)+PX(k)*PX(l)*PX(m);
                        test=i;
                        testP=PY(i);
                    end
                end
           end
        end
    end

subplot(1,2,1)
stem(PX)
hold on;
stem (PY)
hold on;
xlabel('Value')
ylabel('Probability')
title('PMF of X and Y')

%%
%-----------------------part II-----------------------------------%
%FX(k)=SUM[PX(xmin)to PX(k)]
FX=[0];
FY=[0];
FX(1)=PX(1);
FY(1)=PY(1);
for k= 2:1:20
    FX(k)=FX(k-1)+PX(k);
    FY(k)=FY(k-1)+PY(k);
end

subplot(1,2,2)
stem(FX)
hold on;
stem(FY)
hold on;
xlabel('Value')
ylabel('Probability')
title('CDF of X and Y')

%%
%-----------------------part III-----------------------------------%
for n = 1:100
    x1(n) = randi(6);
    x2(n) = randi(6);
    x3(n) = randi(6);
    y(n) = x1(n)+x2(n)+x3(n)
end

%%
%------------------------part IV----------------------------------%
