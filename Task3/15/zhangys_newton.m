xdat = load('q1x.dat');
ydat = load('q1y.dat');
col = length(ydat);
xdat = [ones(col,1) xdat];



for i = 1:col               %show the points(x1,x2) with diffrent symbols('o' represent 'y = 1'and '+' represent 'y = 0') 
    if ydat(i)
        plot(xdat(i,2),xdat(i,3),'ro');
        hold on;
    else
        plot(xdat(i,2),xdat(i,3),'b+');
        hold on;
    end;
end;

theta = [1;1;1];              %initialise matrix theta and learning rate alf
alf = 1;
hease = zeros(3,3);
transpose_xdat = xdat';

while 1                       %newton 
    h = 1 ./ (1 + exp(-xdat * theta));
    g = (1 / col) * xdat' * (h - ydat);
    divisor = (1 / col) * h .* (1 - h);
    for i = 1 : 3
        for j = 1 : 3
            hease(i,j) = transpose_xdat(i,:) .* transpose_xdat(j,:) * divisor;
        end;
    end;
    theta = theta - pinv(hease) * g;
    if abs(sum(tmp_theta - theta)) <= 0.5
        theta = tmp_theta;
        break;
    end;
    theta = tmp_theta;
end;

xdat = [min(xdat(:,2)) - 3 max(xdat(:,2) + 3)];
ydat = [ -1. / theta(3) * (theta(2) * xdat + theta(1))];
plot(xdat,ydat);
hold off;

title('ZhangYongShun Task3');

print -dpng  'zhangyongshun.png'
