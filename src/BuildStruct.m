function [MyData] = buildStruct(dataDir,numOfSubject,cond)
    MyData = struct();
    for i = 1:numOfSubject
        curSubject = char("subject" + i);
        for j = 1:length(cond)
            nameToLook = char(i + ".*" + cond(j));
            fileIndex = regexp({dataDir.name},nameToLook);
            fileIndexTO = find(~cellfun(@isempty,fileIndex));
            MyData.(curSubject).(cond(j)) = edfread([dataDir(fileIndexTO).folder '\' dataDir(fileIndexTO).name]);
        
        end
    end
end

    
    