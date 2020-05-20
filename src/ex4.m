clear all
close all

%% expariment param
fs = 256; % sampling frequency, Hz
dt = 1/fs; % time step [sec]
f = 6:0.1:14; % Define a frequency band to picture Alpha waves
dur = 180; % duration of signal [sec]
t = 0:dt:dur; % times vector [sec]
%N = length(t); % number of time components;        
electrodeNum = 19;


%% data handling

MyFiles = dir('..\DATA_DIR\**\*.edf');
charToValidate = '\d*E[OC]';
cond = ["EC","EO"];
numOfSub = length(MyFiles)/length(cond);
validateFileNames = cellfun('isempty',regexp({MyFiles.name},charToValidate));
MyData = buildStruct(MyFiles,numOfSub,cond);

for i = 1:numOfSub
    curSubject = char("subject" + i);
    for j = 1:length(cond)
       title = char(cond(j) + "_data");
       spectromVec =  spectromPower(MyData,cond(j),curSubject,electrodeNum);
       plot(spectromVec)
    end
end

N = 10;
for k=0:N-1
    for l=0:N-1
        w(k+1,l+1)=cos((2*pi*k*l)/N)-1*sin((2*pi*k*l)/N);
    end
end

