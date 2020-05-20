clear all
close all

%% expariment param
fs = 256; % sampling frequency, Hz
dt = 1/fs; % time step [sec]
f = 6:0.1:14; % Define a frequency band to picture Alpha waves
dur = 180; % duration of signal [sec]
t = 0:dt:dur; % times vector [sec]
%N = length(t); % number of time components;        



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
        dataType = char(cond(j) + "_data");
        dataType = MyData.(curSubject).(cond(j)).record(19,:);
        dataType = fft(dataType); 
        N = length(dataType);
        freq = (0:(N)-1)./((N/2)*fs); 
        dataType = dataType/norm(dataType);
        dataType = abs(dataType).^2;
        plot(freq,dataType)
    end
end

