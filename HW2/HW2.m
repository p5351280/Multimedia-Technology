clear;
clc;

x = linspace(-2, 2, 500);
y = linspace(-2, 2, 500);
C = [];
origin = [];
for i = 1:500
    for j = 1:500
        if(x(i)^2+y(j)^2 <= 4)
            C = [C complex(x(i), y(j))];
        end
    end
end
origin = C;
plot(C, '.', 'MarkerEdgeColor', 'k');

for iterativeCount = 1:20
    hold on;
    outside = [];
    inside = [];
    originNew = [];
    for i = 1:length(C)
        result = Mandelbrot(C(i), origin(i));
        if(abs(result) > 2)
            outside = [outside origin(i)];
        else
            inside = [inside result];
            originNew = [originNew origin(i)];
        end
    end
    C = inside;
    origin = originNew;
    if mod(iterativeCount, 3) == 1
        plot(outside, '.', 'MarkerEdgeColor', 'r');
    elseif mod(iterativeCount, 3) == 2
        plot(outside, '.', 'MarkerEdgeColor', 'g');
    else
        plot(outside, '.', 'MarkerEdgeColor', 'b');
    end
end