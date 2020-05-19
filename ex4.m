myFiles = dir('..\DATA_DIR\**\*.edf');
charToValidate = '\d*E[OC]';
validateFileNames = cellfun('isempty',regexp({myFiles.name},charToValidate));
paths = structfun('strcat',myFiles
myData = cellfun('edfread',cell([myFiles.folder '\' myFiles.name]));
