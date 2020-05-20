clc;
clear;
MyFiles = dir('..\DATA_DIR\**\*.edf');
cond = ["EC","EO"];
numOfSub = length(MyFiles)/length(cond);
charToValidate = '\d*E[OC]';
validateFileNames = cellfun('isempty',regexp({MyFiles.name},charToValidate));
MyData = BuildStruct(MyFiles,numOfSub,cond);
