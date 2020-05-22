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

%% extract power spectrum

for i = 1:numOfSub
   curSubject = char("subject" + i);
   signalEC = MyData.(curSubject).(cond(1)).record(elecNum,:);   
   signalEO = MyData.(curSubject).(cond(2)).record(elecNum,:);
   fftSpecEC = fftPS(signalEC);
   fftSpecEO = fftPS(signalEO);
   pWelchEC = pwelch(signalEC, windowTP, overlapTP, f, fs);
   pWelchEO = pwelch(signalEO, windowTP, overlapTP, f, fs);
   dftEC = dftPS(signalEC,windowTP,overlapTP);
   dftEO = dftPS(signalEO,windowTP,overlapTP);
   plotPS(f,fftSpecEC,pWelchEC,dftEC,fftSpecEO,pWelchEO,dftEO,i,cond);
   [fftIAF,fftMaxDifVal,fftFreqValMax] = calcIAF(fftSpecEC,fftSpecEO,f);
   [pwelchIAF,pwelchMaxDifVal,pwelchFreqValMax] = calcIAF(pWelchEC,pWelchEO,f);
   [dftIAF,dftMaxDifVal,dftFreqValMax] = calcIAF(dftEC,dftEO,f);
   plotIAF(fftIAF,fftMaxDifVal,fftFreqValMax,pwelchIAF,pwelchMaxDifVal,pwelchFreqValMax,...
    dftIAF,dftMaxDifVal,dftFreqValMax,subNum);
end


