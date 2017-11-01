clc;
clear;
dirs = pwd();
[trainMatrix, testMatrix, trainBelong, testBelong] = loading(dirs);
cd(dirs);
[row, trainCount] = size(trainMatrix);
[row, testCount] = size(testMatrix);
correctSAD = 0;
correctSSD = 0;

for test = 1:testCount
    distance = [];
    for train = 1:trainCount
        distance(:,train) = testMatrix(:,test) - trainMatrix(:,train);  % find distance between two picture
    end
    
    SAD = sum(abs(distance));   % calculate SAD
    [value, index] = min(SAD);  % find the min SAD
    if testBelong(test) == trainBelong(index)   % belong to the same person
        correctSAD = correctSAD+1;
    end
    
    SSD = sum((distance).^2);   % calculate SSD
    [value, index] = min(SSD);  % find the min SSD
    if testBelong(test) == trainBelong(index)   % belong to the same person
        correctSSD = correctSSD+1;
    end
end
fprintf('SAD : %f%%\nSSD : %f%%\n', correctSAD/testCount*100, correctSSD/testCount*100);
        