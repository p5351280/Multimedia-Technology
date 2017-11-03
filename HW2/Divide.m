function [ C, insideCount ] = Divide( minX, maxX, minY, maxY )
%DIVIDE Summary of this function goes here
%   Detailed explanation goes here

x = linspace(minX, maxX, 1000);
y = linspace(minY, maxY, 1000);
C = zeros(1, 1000000);
insideCount = 0;
for i = 1:1000
    for j = 1:1000
        if(x(i)^2+y(j)^2 <= 4)
            insideCount = insideCount+1;
            C(insideCount) = complex(x(i), y(j));
        end
    end
end
C(C(:)==0) = [];
origin = C;
insideCount = length(C);
end

