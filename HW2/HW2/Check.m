function [ inside, outside ] = Check( C, iterativeCount )
%CHECK Summary of this function goes here
%   Detailed explanation goes here
    outside = zeros(1, 800000);
    outsideCount = 0;
    inside = zeros(1, 800000);
    insideCount = 0;
    
    for i = 1:length(C)
        result = Mandelbrot(C(i), iterativeCount);
        if(abs(result) > 2)
            outsideCount = outsideCount+1;
            outside(outsideCount) = C(i);
        else
            insideCount = insideCount+1;
            inside(insideCount) = C(i);
        end
    end
    outside(outside(:)==0) = [];
    inside(inside(:)==0) = [];
end

