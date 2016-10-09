function [J, grad] = R_gradFunc(theta, X, Y)
    [m, n] = size(X);
    h = ones(m,1)./(1+exp(-X*theta));
    J = (-sum(Y.*log(h))+sum((Y-1).*log(1-h)))/m;
    grad = X'*(h-Y)/m;
end