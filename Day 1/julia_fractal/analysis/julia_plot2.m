% Jun Allard jun.allard@uci.edu
% Compute the Julia Set
% for z0, does the mapping z(n+1)=z(n)^2+c, z(0)=z0 go to infinity or
% remain finite? If it goes to infinity, we define z0 as in the Julia set. 
% https://en.wikipedia.org/wiki/Julia_set

%% Plot

clear

load('juliaSet2.mat');

juliaSet = nmax<22; % Julia set is defined as p values that mapped to infinity (here defined as abs(z)>2).

% plot black and white
f1=figure(1); clf; hold on; box on;
plot(real(p(juliaSet)), imag(p(juliaSet)), '.k');

% plot coloring according to exit number
figure(2); clf; hold on; box on;
scatter(real(p(juliaSet)), imag(p(juliaSet)), 10, nmax(juliaSet));
colormap(cool);

saveas(f1,'julia2.png')