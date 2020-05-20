clc;
clear;

myFiles = dir('..\DATA_DIR\**\*.edf');
charToValidate = '\d*E[OC]';
validateFileNames = cellfun('isempty',regexp({myFiles.name},charToValidate));

cond = ["EC","EO"];
numOfSub = length(MyFiles)/length(cond);
MyData = buildStruct(MyFiles,numOfSub,cond);

