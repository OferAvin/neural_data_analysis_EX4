clear all
close all

%% expariment param
fs = 256; % sampling frequency, Hz
dt = 1/fs; % time step [sec]
f = 6:0.1:14; % Define a frequency band to picture Alpha waves
dur = 180; % duration of signal [sec]
t = 0:dt:dur; % times vector [sec]        
electrodeNum = 19;
window = 5*fs; %Number of segments
noverlap =2*fs;% No overlap


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

%% bulding complex metrix
k = 1:window;
n = 1:window;
W = exp(-2.*pi.*1i.*n'*k/window);
spectromVec =  spectromPower(MyData,cond(1),'subject1',electrodeNum);
resVec = buildDftMetrix(window,noverlap,spectromVec);


