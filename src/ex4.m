<<<<<<< HEAD
myFiles = dir('..\DATA_DIR\**\*.edf');
charToValidate = '\d*E[OC]';
validateFileNames = cellfun('isempty',regexp({myFiles.name},charToValidate));

=======
MyFiles = dir('..\DATA_DIR\**\*.edf');
charToValidate = '\d*E[OC]';
validateFileNames = cellfun('isempty',regexp({MyFiles.name},charToValidate));
[MyData] = build_struct(MyFiles);
>>>>>>> 4e2d113763f31c184df3a9ef23bdb7b944c94c31
