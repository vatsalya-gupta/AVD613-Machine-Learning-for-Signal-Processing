%{
Script to generate the plots of
multivariable h31 and f
%}

close all; clear; clc;
figure('WindowState','maximized');

[x1,x2] = meshgrid(-5:0.2:5,-5:0.2:5);

h11 = 1./(1 + exp(-(x1 + 100.*x2 + 200)));
h12 = 1./(1 + exp(-(x1 + 100.*x2 - 200)));
h13 = 1./(1 + exp(-(100.*x1 + x2 + 200)));
h14 = 1./(1 + exp(-(100.*x1 + x2 - 200)));
h21 = h11 - h12;
h22 = h13 - h14;
h31 = h21 + h22;
f = 1./(1 + exp(-(50.*h31 -100)));

subplot(2,3,1);
surf(x1,x2,h31);
shading interp;
set(gca,'fontname','times new roman','fontsize',14);
xlabel('$x_1$','interpreter','latex','FontSize',14);
ylabel('$x_2$','interpreter','latex','FontSize',14);
zlabel('$h_{31} = h_{21}(x_1,x_2) - h_{22}(x_1,x_2)$','FontSize',14,'interpreter','latex');
grid on;
box on;

subplot(2,3,2);
surf(x1,x2,f);
shading interp;
set(gca,'fontname','times new roman','fontsize',14);
xlabel('$x_1$','interpreter','latex','FontSize',14);
ylabel('$x_2$','interpreter','latex','FontSize',14);
zlabel('$f = \frac{1}{1 + e^{-(50h_{31}(x_1,x_2) - 100)}}$','FontSize',14,'interpreter','latex');
grid on;
box on;

print -depsc2 fig_3.eps
