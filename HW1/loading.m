function[trainMatrix, testMatrix, trainBelong, testBelong] = loading(dirs)
trainMatrix = [];    % store every training file in a column 
testMatrix = [];    % store every test file in a column
trainBelong = [];    % each training file belong to whom
testBelong = [];    % each test file belong to whom
countOfPeople = 0;

for i = 1:39
    if i==14    % no 14th person
        continue
    end
    path = fullfile(dirs, 'CroppedYale', sprintf('yaleB%02d', i));  % use fullfile can cross OS
    %path = strcat(dirs, sprintf('/CroppedYale/yaleB%02d/', i)); 
    % if using in Windows, change "/" to "\"  
    
    temp = fullfile(path, '*.pgm');
    file = dir(temp);   % find all pgm file, P00_Ambient.pgm need deleted by self
    countOfPeople = length(file);   % count how many pgm file in the folder
    cd(path);
    for j = 1:35    % read 35 pictures for training
        imdata = imread(file(j).name);
        X = double(imdata(:));
        trainMatrix = [trainMatrix X];    % add data to matrix
        trainBelong = [trainBelong i];
    end
    for j = 36:countOfPeople    % other pictures for testing
        imdata = imread(file(j).name);
        X = double(imdata(:));
        testMatrix = [testMatrix X];    % add data to matrix
        testBelong = [testBelong i];
    end    
end

end