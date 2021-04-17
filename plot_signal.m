close all
clear all
clc

load DB/u1050s0004_sg0007.mat;

FeatVector = featureExtractor(x,y,p);

figure(1),plot(x,y),title('x as a function of y'),
xlabel('x Coordinate'),ylabel('y Coordinate');

figure(2),plot(x),title('x as a function of t'),
xlabel('t seconds (time)'),ylabel('y Coordinate');
xt = get(gca, 'XTick');                                 
set(gca, 'XTick', xt, 'XTickLabel', xt/200)  ;

figure(3),plot(y),title('y as a function of t'),
xlabel('t seconds (time)'),ylabel('y Coordinate');
xt = get(gca, 'XTick');                                 
set(gca, 'XTick', xt, 'XTickLabel', xt/200)  ;

figure(4),plot(p),title('p as a function of t'),
xlabel('t seconds (time)'),ylabel('p pression');
xt = get(gca, 'XTick');                                 
set(gca, 'XTick', xt, 'XTickLabel', xt/200)  ;


