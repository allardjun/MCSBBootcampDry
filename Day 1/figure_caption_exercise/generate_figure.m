%% Panel A

ka=[300,400,425,450,375,300];
n=[4,3,2,1.8,1.4,1.2];
cmax=50;

x=0:1000;
figure
hold on

cs=cool(6);

for i=1:6
    y=cmax*x.^n(i)./(ka(i)^n(i)+x.^n(i));
    plot(x,y,'color',cs(i,:))
end

legend('\alpha=.2','\alpha=.4','\alpha=.6','\alpha=.8','\alpha=1','\alpha=1.2','Location','SouthEast')

xlabel('\tau')
ylabel('S_\alpha')
title('A')

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 10 6]);
print('FigA','-dpng','-r100')

%% Panel B

se1=[30, 200, 700, 4000, 2500, 62000, 37000];
se2=[7, 9, 12, 3, 17, 10, 14];
m=[112, 1460, 1970, 20000, 25600, 100000, 301000];

se3=[46, 150, 600, 5000, 2700, 64000, 33000];
se4=[5, 4, 9, 7, 15, 12, 10];
m2=[101, 1520, 6000, 15000, 23600, 200000, 305000];

x=[25, 30, 35, 40, 45, 50, 55];
x2=[21, 32, 37, 42, 47, 49, 57];

errorbar(x,m,se1,se1,se2,se2,'.')
hold on
errorbar(x2,m2,se3,se3,se4,se4,'.')
set(gca,'yscale','log')
set(gca,'xscale','log')

x3=20:65;
plot(x3,x3.^9/20000000000,'k')
plot(x3,exp(x3.^.8)/7000,'k-.')

ylim([10,10^7])

xlabel('\xi_{m}')
ylabel('\alpha')
legend('B7','alm\Delta','\xi_{m}^{s}/l_{\infty}','exp(\xi_{m}^{p})/l_{0}',...
    'Location','NorthWest')
title('B')

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 10 10]);
print('FigB','-dpng','-r100')
