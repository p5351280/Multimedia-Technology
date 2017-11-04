function [ limx1, limx2, limy1, limy2 ] = Controlmove( limx1, limx2, limy1, limy2, count )
%CONTROLMOVE Summary of this function goes here
%   Detailed explanation goes here
    if count>0 && count<=60
        if mod(count, 20) <= 10 && count<45
            limy1 = limy1-0.075;
            limy2 = limy2-0.075;
            xlim([limx1, limx2]);
            ylim([limy1, limy2]);
        else
            limx1 = limx1*0.95;
            limx2 = limx2*0.95;
            limy1 = limy1*0.95;
            limy2 = limy2*0.95;
            xlim([limx1, limx2]);
            ylim([limy1, limy2]);
        end
    elseif count>60 && count<=120
        if mod(count, 20) >= 10 && count>=75
            limy1 = limy1+0.075;
            limy2 = limy2+0.075;
            xlim([limx1, limx2]);
            ylim([limy1, limy2]);
        else 
            limx1 = limx1/0.95;
            limx2 = limx2/0.95;
            limy1 = limy1/0.95;
            limy2 = limy2/0.95;
            xlim([limx1, limx2]);
            ylim([limy1, limy2]);
        end
    end
end

