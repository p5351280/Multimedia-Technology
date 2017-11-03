function [ result ] = Mandelbrot( origin, iteration )
%MANDELBROT Summary of this function goes here
%   Detailed explanation goes here
    result = origin;
    for i = 1:iteration
        result = result^2 + origin;
    end
end