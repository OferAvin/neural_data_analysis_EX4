clear all
close all

%% expariment param
fs = 256; % sampling frequency, Hz
dt = 1/fs; % time step [sec]
f = 6:0.1:14; % Define a frequency band to picture Alpha waves
dur = 180; % duration of signal [sec]
t = 0:dt:dur; % times vector [sec]
%N = length(t); % number of time components;        
elecNum = 19;

windowSec = 5;
overlapSec = 2;
windowTP = windowSec*fs;
overlapTP = overlapSec*fs;


%% data handling

MyFiles = dir('..\DATA_DIR\**\*.edf');
charToValidate = '\d*E[OC]';
cond = ["EC","EO"];
numOfSub = length(MyFiles)/length(cond);
validateFileNames = cellfun('isempty',regexp({MyFiles.name},charToValidate));
MyData = buildStruct(MyFiles,numOfSub,cond);

for i = 1:numOfSub
   curSubject = char("subject" + i);
   titleEC = char(cond(1) + "_data");
   titleEO = char(cond(2) + "_data");
   signalEC = MyData.(curSubject).(cond(1)).record(elecNum,:);   
   signalEO = MyData.(curSubject).(cond(2)).record(elecNum,:);
   fftSpecEC = fftPS(signalEC);
   fftSpecEO = fftPS(signalEO);
   pWelchEC = pwelch(signalEC, windowTP, overlapTP, f, fs);
   pWelchEO = pwelch(signalEO, windowTP, overlapTP, f, fs);
   dftEC = dftPS(signalEC,windowTP,overlapTP);
   dftEO = dftPS(signalEO,windowTP,overlapTP);
   plotPS(fftSpecEC,pWelchEC,dftEC)
end

