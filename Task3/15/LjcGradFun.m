function [J,grad] = LjcGradFun(theta,X,y)
    [m n] = size(X);
    h = ones(m,1)./(1+exp(-X*theta));
    J = (sum(-(y.*log(h) + (1-y).*log(1-h))))/m;
    grad = X'*(h-y)/m;
end

