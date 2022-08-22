%{
Script to generate the plots of
multivariable h11, h12, h13, h14, h21 and h22
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

subplot(2,3,1);
surf(x1,x2,h11);
shading interp;
set(gca,'fontname','times new roman','fontsize',14);
xlabel('$x_1$','interpreter','latex','FontSize',14);
ylabel('$x_2$','interpreter','latex','FontSize',14);
zlabel('$h_{11}(x_1,x_2) = \frac{1}{1 + e^{-(x_1 + 100x_2 + 200)}}$','FontSize',14,'interpreter','latex');
grid on;
box on;

subplot(2,3,2);
surf(x1,x2,h12);
shading interp;
set(gca,'fontname','times new roman','fontsize',14);
xlabel('$x_1$','interpreter','latex','FontSize',14);
ylabel('$x_2$','interpreter','latex','FontSize',14);
zlabel('$h_{12}(x_1,x_2) = \frac{1}{1 + e^{-(x_1 + 100x_2 - 200)}}$','FontSize',14,'interpreter','latex');
grid on;
box on;

subplot(2,3,3);
surf(x1,x2,h13);
shading interp;
set(gca,'fontname','times new roman','fontsize',14);
xlabel('$x_1$','interpreter','latex','FontSize',14);
ylabel('$x_2$','interpreter','latex','FontSize',14);
zlabel('$h_{13}(x_1,x_2) = \frac{1}{1 + e^{-(100x_1 + x_2 + 200)}}$','FontSize',14,'interpreter','latex');
grid on;
box on;

subplot(2,3,4);
surf(x1,x2,h14);
shading interp;
set(gca,'fontname','times new roman','fontsize',14);
xlabel('$x_1$','interpreter','latex','FontSize',14);
ylabel('$x_2$','interpreter','latex','FontSize',14);
zlabel('$h_{14}(x_1,x_2) = \frac{1}{1 + e^{-(100x_1 + x_2 - 200)}}$','FontSize',14,'interpreter','latex');
grid on;
box on;

subplot(2,3,5);
surf(x1,x2,h21);
shading interp;
set(gca,'fontname','times new roman','fontsize',14);
xlabel('$x_1$','interpreter','latex','FontSize',14);
ylabel('$x_2$','interpreter','latex','FontSize',14);
zlabel('$h_{21} = h_{11}(x_1,x_2) - h_{12}(x_1,x_2)$','FontSize',14,'interpreter','latex');
grid on;
box on;

subplot(2,3,6);
surf(x1,x2,h22);
shading interp;
set(gca,'fontname','times new roman','fontsize',14);
xlabel('$x_1$','interpreter','latex','FontSize',14);
ylabel('$x_2$','interpreter','latex','FontSize',14);
zlabel('$h_{22} = h_{13}(x_1,x_2) - h_{14}(x_1,x_2)$','FontSize',14,'interpreter','latex');
grid on;
box on;

print -depsc2 fig_2.eps
