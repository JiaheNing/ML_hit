function[J grad] = LjcNewtonFun(theta X y)
    [m n] = size(X);
    h = ones(m,1)./(1+exp(-X*theta));
    J = (sum(-(y.*log(h) + (1-y).*log(1-h))))/m;
    H = zeros(n,n);
    for j = 1:m
        H = H + h(j)*(1-h(j))*X(j,:)'*X(j,:);
    end;
    H = H/m;
    grad = pinv(H)*X'*(h-Y)/m;
end