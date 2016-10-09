clear;
clc;
close all;
X = load('q2x.dat');
y = load('q2y.dat');
X = [ones(size(X,1),1) X];
plot(X(:,2),y,'rx');
axis([-6 12 -2 2.5]);
xlabel('X');
ylabel('Y');
hold on;
t = [0.01 0.03 0.1 0.3 1 3 10];
[m n] = size(X);
for i = 1:length(t)
    W = zeros(m,m);
    theta = zeros(n,m);
    for j = 1:m
        for k = 1:m
            W(k,k) = exp(-(X(j,2)-X(k,2))^2/(2*t(i)^2));
        end
        theta(:,j) = pinv(X'*W*X)*X'*W*y;
    end
    M = diag(X*theta);
    h = [X(:,2) M];
    h = sortrows(h,1);
    hold on;
    plot(h(:,1),h(:,2));
end
legend('training data','t=0.01','t=0.03','t=0.1','t=0.3','t=1.0','t=3.0','t=10.0');
    
    
    