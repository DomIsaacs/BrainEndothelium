function [u1,u0,v] = rskewn(N,alpha,loc,scale)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    sigma = alpha / (sqrt(1.0 + alpha^2));
    u0 = randn(N,1);
    v = randn(N,1);
    u1 = [];
    for i = 1:N
            u1(i) = (sigma*u0(i) + sqrt(1.0 - sigma^2)*v(i)) * scale;
         if u0(i) < 0
            u1(i) = abs(u1(i));
         end
    end
    u1 = u1 + loc;
end

