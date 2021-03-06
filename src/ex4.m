%MATLAB 2019a
clear all
close all

%% expariment param
fs = 256;       % sampling frequency, Hz
dt = 1/fs;      % time step [sec]
f = 6:0.1:14;   % Define a frequency band to picture Alpha waves
elecNum = 19;
cond = ["EC","EO"];

windowSec = 5;              %window length in secs
overlapSec = 0;             %window overlap length in secs
windowTP = windowSec*fs;    %window length in time points
overlapTP = overlapSec*fs;  %window overlap length in time points

%% data handling
MyFiles = dir('..\DATA_DIR\**\*.edf');      %take files in that path which ands with .edf

%ensure files validity
charToValidate = '\d*E[OC]';            
validateFileNames = cellfun('isempty',regexp({MyFiles.name},charToValidate));   %check for files that contains charToValidate
MyFiles(validateFileNames == 1) = [];       %delete non matching files

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
   [fftSpecEC,fftFreq] = fftPS(signalEC,fs,f);                 
   fftSpecEO = fftPS(signalEO,fs,f);
   
   %perform fourier transformation using pwelch algorithm 
   pWelchEC = pwelch(signalEC, windowTP, overlapTP, f, fs);
   pWelchEO = pwelch(signalEO, windowTP, overlapTP, f, fs);
   
   %perform fourier transformation using discrete fourier transform 
   [dftEC,dftFreq] = dftPS(signalEC,windowTP,overlapTP,fs,f);
   dftEO = dftPS(signalEO,windowTP,overlapTP,fs,f);
   
   %plot power spectrum
   plotPS(f,fftSpecEC,pWelchEC,dftEC,fftSpecEO,pWelchEO,dftEO,i,fftFreq,dftFreq,cond);
   
   %plot IAF
   plotIAF(f,fftSpecEC,pWelchEC,dftEC,fftSpecEO,pWelchEO,dftEO,i,fftFreq,dftFreq);
end


