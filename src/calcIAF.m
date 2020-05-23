%this function calculates the difference between the two input signals
%and finds its max for IAF. 
function[IAFVec,maxDifVal,freqValMax]= calcIAF(signalEC,signalEO,freq)
    IAFVec=signalEC-signalEO;
    [maxDifVal,maxIndex]=max(abs(IAFVec));
    freqValMax = freq(maxIndex);
end
