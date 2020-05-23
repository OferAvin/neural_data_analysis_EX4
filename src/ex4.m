clear all
close all

%% expariment param
fs = 256;       % sampling frequency, Hz
dt = 1/fs;      % time step [sec]
f = 6:0.1:14;   % Define a frequency band to picture Alpha waves
dur = 180;      % duration of signal [sec]
t = 0:dt:dur;   % times vector [sec]
elecNum = 19;
cond = ["EC","EO"];

windowSec = 5;              %window length in secs
overlapSec = 2;             %window overlap length in secs
windowTP = windowSec*fs;    %window length in time points
overlapTP = overlapSec*fs;  %window overlap length in time points

%% data handling
MyFiles = dir('..\DATA_DIR\**\*.edf');

%ensure files validity
charToValidate = '\d*E[OC]';
validateFileNames = cellfun('isempty',regexp({MyFiles.name},charToValidate));
MyFiles(validateFileNames == 1) = [];

numOfSub = length(MyFiles)/length(cond);

%% assign all edf files to a structure
MyData = buildStruct(MyFiles,numOfSub,cond);

%% extract and plot power spectrum and IAF
for i = 1:numOfSub
   curSubject = char("subject" + i);
   
   %extracting signal 
   signalEC = MyData.(curSubject).(cond(1)).record(elecNum,:);    
   signalEO = MyData.(curSubject).(cond(2)).record(elecNum,:);
   
   %perform fast fourier transformation 
   [fftSpecEC,freqValsEC] = fftPS(signalEC,fs,f);                 
   [fftSpecEO,freqValsEO] = fftPS(signalEO,fs,f);
   
   %perform fourier transformation using pwelch algorithm 
   pWelchEC = pwelch(signalEC, windowTP, overlapTP, f, fs);
   pWelchEO = pwelch(signalEO, windowTP, overlapTP, f, fs);
   
   %perform fourier transformation using discrete fourier transform 
   dftEC = dftPS(signalEC,windowTP,overlapTP);
   dftEO = dftPS(signalEO,windowTP,overlapTP);
   
   %plot power spectrum
   plotPS(f,fftSpecEC,pWelchEC,dftEC,fftSpecEO,pWelchEO,dftEO,i,freqValsEC,freqValsEO,cond);
   
   %plot IAF
   plotIAF(f,fftSpecEC,pWelchEC,dftEC,fftSpecEO,pWelchEO,dftEO,i,freqValsEC,cond);
end


