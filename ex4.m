MyFiles = dir('..\DATA_DIR\**\*.edf');
charToValidate = '\d*E[OC]';
validateFileNames = cellfun('isempty',regexp({MyFiles.name},charToValidate));
[MyData] = build_struct(MyFiles);
