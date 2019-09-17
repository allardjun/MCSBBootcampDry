N = 10; % number of scoops in each jar
nMax = 2*N; % max number of days to simulate
x = ones(1,nMax); % fraction caffenaited
x(1) = 1.0; % initial fraction caffenaited

for n=2:nMax
    
    x(n) = (1-1/N)*x(n-1);
    
end % finished loop through days

figure;
plot(x,'-ok');
ylabel('Fraction caffenaited');
xlabel('Days');