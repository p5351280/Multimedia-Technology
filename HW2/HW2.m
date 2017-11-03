clear;
clc;

[C, insideCount] = Divide(-2, 2, -2, 2);
frame = 0;
plot(C, '.', 'MarkerEdgeColor', 'k');
frame = frame+1;
M(frame) = getframe;

for iterativeCount = 1:1000
    hold on;
    [inside, outside] = Check(C, iterativeCount);
    C = inside;
    if mod(iterativeCount, 3) == 1
        plot(outside, '.', 'MarkerEdgeColor', 'r');
    elseif mod(iterativeCount, 3) == 2
        plot(outside, '.', 'MarkerEdgeColor', 'g');
    else
        plot(outside, '.', 'MarkerEdgeColor', 'b');
    end
    frame = frame+1;
    M(frame) = getframe;
    
    if mod(iterativeCount, 10) == 0
        
        [C, insideCount] = Divide(-1, 1, -1, 1);
        [inside, outside] = Check(C, iterativeCount);
        C = inside;
    end
    zoom(1.01);
end

%movie(M, 10);