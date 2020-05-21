%this function build the struct for the expairiment for each subject and
%each condition
function [MyData] = buildStruct(Files,numOfSubject,cond)
    MyData = struct();
    for i = 1:numOfSubject
        curSubject = char("subject" + i);
        for j = 1:length(cond)
            nameToLook = char(i + ".*" + cond(j));
            fileIndex = regexp({Files.name},nameToLook);
            fileIndexToSearch = find(~cellfun(@isempty,fileIndex));
            [MyData.(curSubject).(cond(j)).header,MyData.(curSubject).(cond(j)).record] = ...
                edfread([Files(fileIndexToSearch).folder '\' Files(fileIndexToSearch).name]);
        
        end
    end
end

    
    