%%this is Matlab Code for Question 1
close all
clear all
clc
%%
%-----------------------part I-----------------------------------%
X = linspace(1,20,20);
Y = linspace(3,18,16);
i=1;
for k = 1:1:20
    if i<7
        if (k==X(i))
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
    for i = 1:1:20
        for k = 1:1:6
            for l = 1:1:6
                for m = 1:1:6
                    if i == k + l + m
                        PY(i)= PY(i)+PX(k)*PX(l)*PX(m);
                        test = i;
                        testP = PY(i);
                    end
                end
           end
        end
    end

subplot(1,2,1)
stem(PX,'g')
hold on;
stem (PY)
hold on;
xlabel('Value')
ylabel('Probability')
legend('PMF X', 'PMF Y')
title('PMF of X and Y')

%%
%-----------------------part II-----------------------------------%
FX=[0];
FY=[0];
FX(1)=PX(1);
FY(1)=PY(1);
for k= 2:1:20
    FX(k)=FX(k-1)+PX(k);
    FY(k)=FY(k-1)+PY(k);
end

subplot(1,2,2)
stem(FX,'r')
hold on;
stem(FY)
hold on;
xlabel('Value')
ylabel('Probability')
legend('CDF X', 'CDF Y')
title('CDF of X and Y')

 %%
%-----------------------part III -----------------------------------%
H1 = zeros(6,1);
H2 = zeros(6,1);
H3 = zeros(6,1);
HY = zeros(18,1);

N = 100;
for n = 1:N
    x1(n) = randi(6);
    x2(n) = randi(6);
    x3(n) = randi(6);
    y(n) = x1(n) + x2(n) + x3(n);
end
%%
%-----------------------part IV -----------------------------------%
%loop to see occurances of each number
for i = 1:N
    for k = 1:6
        if (x1(i) == k)
            H1(k) = H1(k) + 1;
        end
        if (x2(i) == k)
            H2(k) = H2(k) + 1;
        end 
        if (x3(i) == k)
            H3(k) = H3(k) + 1;
        end
    end
      
 %-----------------------part V -----------------------------------%
   %loop to check occurances of sums   
        for k = 3:18
            if (y(i) == k)
                HY(k) = HY(k) + 1;
            end
        end
 end
  
    
    
    HTOTAL = [H1,H2,H3];
    figure(3);
    bar(HTOTAL);
    legend('Dice 1', 'Dice 2', 'Dice 3', 'location', 'southeast')
    xlabel('Value')
    ylabel('Probability')
    title('Occuraances of each outcome')


    figure(4)
    bar(HY)
    xlabel('Value')
    ylabel('Probability')
    title('Occurances of summed outcomes')
