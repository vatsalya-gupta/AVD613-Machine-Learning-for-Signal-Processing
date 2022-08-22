%{
Script to generate the plots of
single variable h11, h12 and h21
%}

close all; clear; clc;
figure('WindowState','maximized');
hold on;

x = -1:0.001:1;

h11 = 1./(1 + exp(-(400.*x + 24)));
h12 = 1./(1 + exp(-(400.*x - 24)));
h21 = h11 - h12;

subplot(2,3,1);
plot(x,h11,'-g','LineWidth',1);
set(gca,'fontname','times new roman','fontsize',14);
xlabel('$x$','interpreter','latex','FontSize',14);
ylabel('$h_{11}(x) = \frac{1}{1 + e^{-(400x + 24)}}$','FontSize',14,'interpreter','latex');
grid on;
box on;
ylim([-0.05,1.05]);

subplot(2,3,2);
plot(x,h12,'-black','LineWidth',1);
set(gca,'fontname','times new roman','fontsize',14);
xlabel('$x$','interpreter','latex','FontSize',14);
ylabel('$h_{12}(x) = \frac{1}{1 + e^{-(400x - 24)}}$','FontSize',14,'interpreter','latex');
grid on;
box on;
ylim([-0.05,1.05]);

subplot(2,3,3);
plot(x,h21,'-b','LineWidth',1);
set(gca,'fontname','times new roman','fontsize',14);
xlabel('$x$','interpreter','latex','FontSize',14);
ylabel('$h_{21} = h_{11}(x) - h_{12}(x)$','FontSize',14,'interpreter','latex');
grid on;
box on;
ylim([-0.05,1.05]);

print -depsc2 fig_1.eps
