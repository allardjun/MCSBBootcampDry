% Simulat a discrete-time dynamical system

% Model parameter
a = 0.4;

nMax = 10;% max number of days to simulate
x = ones(1,nMax); % population
x(1) = 1.0; % initial condition

for n=2:nMax
    
    x(n) = a*x(n-1);
    
end % finished loop through days

figure;
plot(x,'-ok');
ylabel('Population');
xlabel('Days');