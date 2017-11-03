clear;
clc;

x = linspace(-2, 2, 500);
y = linspace(-2, 2, 500);
C = zeros(1, 250000);
insideCount = 0;
for i = 1:500
    for j = 1:500
        if(x(i)^2+y(j)^2 <= 4)
            insideCount = insideCount+1;
            C(insideCount) = complex(x(i), y(j));
        end
    end
end
C(C(:)==0) = [];
origin = C;
insideCount = length(C);
plot(C, '.', 'MarkerEdgeColor', 'k');

for iterativeCount = 1:20
    hold on;
    len = insideCount;
    outside = zeros(1, 250000);
    outsideCount = 0;
    inside = zeros(1, 250000);
    originNew = zeros(1, 250000);
    insideCount = 0;
    
    for i = 1:len
        result = Mandelbrot(C(i), origin(i));
        if(abs(result) > 2)
            outsideCount = outsideCount+1;
            outside(outsideCount) = origin(i);
        else
            insideCount = insideCount+1;
            inside(insideCount) = result;
            originNew(insideCount) = origin(i);
        end
    end
    outside(outside(:)==0) = [];
    inside(inside(:)==0) = [];
    originNew(originNew(:)==0) = [];
    origin = originNew;
    C = inside;
    if mod(iterativeCount, 3) == 1
        plot(outside, '.', 'MarkerEdgeColor', 'r');
    elseif mod(iterativeCount, 3) == 2
        plot(outside, '.', 'MarkerEdgeColor', 'g');
    else
        plot(outside, '.', 'MarkerEdgeColor', 'b');
    end
end