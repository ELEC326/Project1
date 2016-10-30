%% Question 2 I
load('RV1.mat');
load('RV2.mat');
load('RV3.mat');

%% Calculating expected value for:

%% RV1
RV1_total = 0;
for i = 1:length(RV1)
    RV1_total = RV1(i) + RV1_total;
end
RV1_mean = RV1_total / 1000000

%% RV2
RV2_total = 0;
for i = 1:length(RV2)
    RV2_total = RV2(i) + RV2_total;
end
RV2_mean = RV2_total / 1000000

%% RV3
RV3_total = 0;
for i = 1:length(RV3)  
    RV3_total = RV3(i) + RV3_total;
end
RV3_mean = RV3_total / 1000000

%% Calculating the variance for:

%% RV1

RV1_squared = RV1.^2;
RV1_squared_total = 0;
for i = 1:length(RV1_squared)
    RV1_squared_total = RV1_squared(i) + RV1_squared_total;
end    

RV1_mean_squared = RV1_squared_total / 1000000; 
RV1_variance = RV1_mean_squared - RV1_mean.^2  % Var(x) = E[x^2] - [E(x)]^2

%% RV2
RV2_squared = RV2.^2;
RV2_squared_total = 0;
for i = 1:length(RV2_squared)
    RV2_squared_total = RV2_squared(i) + RV2_squared_total;
end    

RV2_mean_squared = RV2_squared_total / 1000000; 
RV2_variance = RV2_mean_squared - RV2_mean.^2  

%% RV3
RV3_squared = RV3.^2;
RV3_squared_total = 0;
for i = 1:length(RV3_squared)
    RV3_squared_total = RV3_squared(i) + RV3_squared_total;
end    

RV3_mean_squared = RV3_squared_total / 1000000;
RV3_variance = RV3_mean_squared - RV3_mean.^2  

%% Question 2) II
%% RV1

H1 = zeros(1, 101);  %% setting the vectors H1-H3 as 100 elements of zeros.
for i = 1:101        %% The elements must be 1-101 because H1(1) because vector indexing starts at 1 
  for j = 1:1000000
      if (RV1(j) == i-1)
        H1(i) = H1(i) + 1;
      end
  end
end

H1_quotient = H1 ./ 1000000;  %% dividing each element by 1 million with './'

%% RV2

H2 = zeros(1, 101);  
for i = 1:101
  for j = 1:1000000
    if (RV2(j) == i-1)
    H2(i) = H2(i) + 1;
    end
  end
end

H2_quotient = H2 ./ 1000000;

%% RV3
H3 = zeros(1, 101);
for i = 1:101
  for j = 1:1000000
      if (RV3(j) == i-1)
        H3(i) = H3(i) + 1;
      end
  end
end

H3_quotient = H3 ./ 1000000;
%% Graphs
figure 
hold on
plot(0:100, H1_quotient, 'x')
title('Uniform RV')
xlabel('x')
ylabel('pdf(x)')
line([RV1_mean RV1_mean],[0 max(H1_quotient)])

figure 
hold on
plot(0:100, H2_quotient, 'x')
title('Binomial RV')
xlabel('x')
ylabel('pdf(x)')
line([RV2_mean RV2_mean],[0 max(H2_quotient)])

figure 
hold on
plot(0:100, H3_quotient, 'x')
title('Poisson RV')
xlabel('x')
ylabel('pdf(x)')
line([RV3_mean RV3_mean],[0 max(H3_quotient)])

%% Question 3) III
H1_probability = 0;
H2_probability = 0;
H3_probability = 0;

for i=11:41
    H1_probability = H1_probability + H1_quotient(i);
end

for i=11:41
    H2_probability = H2_probability + H2_quotient(i);
end

for i=11:41
    H3_probability = H3_probability + H3_quotient(i);
end
disp('Probability that Uniform RV is between 10 and 40 is =')   
disp(H1_probability)
disp('Probability that Binomial RV is between 10 and 40 is =')
disp(H2_probability)
disp('Probability that Poisson RV is between 10 and 40 is =')
disp(H3_probability)
    
  
