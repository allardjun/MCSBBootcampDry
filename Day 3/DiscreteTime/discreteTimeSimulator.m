% Simulate a discrete-time dynamical system

% x- population of RABBITS in thousands
% n- time in WEEKS

nMax = 20;% max number of days to simulate
x = ones(1,nMax); % population
x(1) = 1.0; % initial condition

for n=2:nMax
    
    x(n) = x(n-1) + 5;
    
end % finished loop through days

figure;
plot(x,'-ok');
ylabel('Rabbits (in thousands)');
xlabel('Weeks');