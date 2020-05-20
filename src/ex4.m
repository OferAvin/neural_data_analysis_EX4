<<<<<<< HEAD
clear all
close all

%% expariment param
fs = 256; % sampling frequency, Hz
dt = 1/fs; % time step [sec]
f = 6:0.1:14; % Define a frequency band to picture Alpha waves
dur = 1; % duration of signal [sec]
t = 0:dt:dur; % times vector [sec]
N = length(t); % number of time components
noverlap = [];
window = 5*fs;
%pwelch(x, window, noverlap, f, fs);

%% data handling
=======
clc;
clear;
>>>>>>> 7729ab39857adec48fa936a0bb2dac9f3ca5492b

MyFiles = dir('..\DATA_DIR\**\*.edf');
charToValidate = '\d*E[OC]';
validateFileNames = cellfun('isempty',regexp({MyFiles.name},charToValidate));
<<<<<<< HEAD
MyData = BuildStruct(MyFiles,numOfSub,cond);

    
    
    
    
    
=======

cond = ["EC","EO"];
numOfSub = length(MyFiles)/length(cond);
MyData = buildStruct(MyFiles,numOfSub,cond);


>>>>>>> 7729ab39857adec48fa936a0bb2dac9f3ca5492b
