clear ; close all; clc

X = load('q1x.dat');
Y = load('q1y.dat');
pos = find(Y==1);   neg = find(Y==0);

figure; hold on;
axis([-1 9 -5 4]);
plot(X(pos,1),X(pos,2),'r+');
plot(X(neg,1),X(neg,2),'mO');

X = [ones(size(X,1),1),X];
[m, n] = size(X);
init_theta = zeros(n,1);

options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = fminunc(@(t)(R_costFunction(t, X, Y)), init_theta, options);

plot_X = [min(X(:,2))-2, max(X(:,2))+2];
plot_Y = -(theta(2).*plot_X + theta(1))/theta(3);
plot(plot_X, plot_Y);
hold off;

