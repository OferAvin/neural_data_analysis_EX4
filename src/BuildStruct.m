
function [MyData] = buildStruct(dataDir,numOfSubject,cond)
%this function build the struct for the expairiment for each subject and
%each condition
    MyData = struct();
    for i = 1:numOfSubject
        curSubject = char("subject" + i);
        for j = 1:length(cond)
            nameToLook = char(i + ".*" + cond(j));
            fileIndex = regexp({dataDir.name},nameToLook);
            fileIndexToSearch = find(~cellfun(@isempty,fileIndex));
            [MyData.(curSubject).(cond(j)).header,MyData.(curSubject).(cond(j)).record] = ...
                edfread([dataDir(fileIndexToSearch).folder '\' dataDir(fileIndexToSearch).name]);
        
        end
    end
end

    
    