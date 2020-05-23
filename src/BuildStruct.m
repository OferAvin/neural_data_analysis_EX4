%this function build the struct for the expairiment for each subject and
%each condition
function MyData = buildStruct(Files,numOfSubject,cond)
    MyData = struct();
    for i = 1:numOfSubject
        curSubject = char("subject" + i);
        
        nameToLook1 = char(i + ".*" + cond(1));
        nameToLook2 = char(i + ".*" + cond(2));
        
        arr1 = regexp({Files.name},nameToLook1);
        arr2 = regexp({Files.name},nameToLook2);

        idx1 = find(~cellfun(@isempty,arr1));
        idx2 = find(~cellfun(@isempty,arr2));
        
        [MyData.(curSubject).(cond(1)).header,MyData.(curSubject).(cond(1)).record] = ...
            edfread([Files(idx1).folder '\' Files(idx1).name]);
        [MyData.(curSubject).(cond(2)).header,MyData.(curSubject).(cond(2)).record] = ...
            edfread([Files(idx2).folder '\' Files(idx2).name]);
    end
end

    
    