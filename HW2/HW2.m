clear;
clc;

[C, insideCount] = Divide(-2, 2, -2, 2);
frame = 0;
axis equal;
plot(C, '.', 'MarkerEdgeColor', 'k');
frame = frame+1;
M(frame) = getframe;
limx1 = -2;
limx2 = 2;
limy1 = -2;
limy2 = 2;
for count = 1:150
    hold on;
    if(count<7)
        iteration = count
    else
        iteration = 7+count/11
    end
    [inside, outside] = Check(C, iteration);
    C = inside;
    colormap autumn;
    colorbar;
    autumncolar = colormap;
    colormap gray;
    colorbar;
    graycolar = colormap;
    if mod(count, 3) == 1
        plot(outside, '.', 'Color', [1,0,0]);
    elseif mod(count, 3) == 2
        plot(outside, '.', 'Color', [0,1,0]);
    else
        plot(outside, '.', 'Color', [0,0,1]);
    end
    %plot(outside, '.', 'Color', autumncolar(mod(count, 64)+1,:));
    %plot(inside, '.', 'Color', graycolar(mod(count, 64)+1,:));

    frame = frame+1;
    M(frame) = getframe;
    [limx1, limx2, limy1, limy2] = Controlmove(limx1, limx2, limy1, limy2, count);

    %if mod(count, 15) == 0
    %    [C, insideCount] = Divide(limx1, limx2, limy1, limy2);
    %    [inside, outside] = Check(C, iteration);
    %    C = inside;
    %end
end

movie(M, 3);