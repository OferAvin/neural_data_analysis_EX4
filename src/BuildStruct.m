function [MyData] = BuildStruct(dataDir)
    MyData = struct();
    for i = 1:length(dataDir)
        curSubject = char("subject" + i);
        MyData.(curSubject) = edfread([dataDir(i).folder '\' dataDir(i).name]);
    end
    