% define ODE and parameters
a_0 = 500; % molecules per hour
a_1 = 0.5; % molecules per hour, per existing molecule of A
b = 4; % 1/hrs
dPdt =@(P) (a_0 + a_1*P) - b*P;

% Find the steady state by plotting the phase line
PArray = linspace(0,200,200);
dPdtPhaseLine = dPdt(PArray);
figure;
plot(PArray,dPdtPhaseLine,'r');
ylabel('dP/dt');
xlabel('P');
refline(0,0); % horizontal line at dPdt=0
legend('dP/dt Phase Line','reference line');



% Find the steady state using fzero
P_SteadyState = fzero(dPdt,120);
display(P_SteadyState);


% Find the steady state by integrating the ODE
[T, P] = ode45(@(t,x)dPdt(x), [0,100],0);
P_SteadyState = P(end);
display(P_SteadyState);