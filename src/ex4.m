myFiles = dir('..\DATA_DIR\**\*.edf');
charToValidate = '\d*E[OC]';
validateFileNames = cellfun('isempty',regexp({myFiles.name},charToValidate));

clc;
clear;

cond = ["EC","EO"];
numOfSub = length(MyFiles)/length(cond);
MyData = BuildStruct(MyFiles,numOfSub,cond);

