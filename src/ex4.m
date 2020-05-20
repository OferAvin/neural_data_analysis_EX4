myFiles = dir('..\DATA_DIR\**\*.edf');
charToValidate = '\d*E[OC]';
validateFileNames = cellfun('isempty',regexp({myFiles.name},charToValidate));

clc;
clear;

MyFiles = dir('..\DATA_DIR\**\*.edf');
cond = ["EC","EO"];
numOfSub = length(MyFiles)/length(cond);
charToValidate = '\d*E[OC]';
validateFileNames = cellfun('isempty',regexp({MyFiles.name},charToValidate));
<<<<<<< HEAD
MyData = BuildStruct(MyFiles,numOfSub,cond);

=======
[MyData] = Build_struct(MyFiles);
>>>>>>> ofer
