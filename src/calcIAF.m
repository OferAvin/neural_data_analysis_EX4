function[IAFVec,maxDifVal,freqValMax]= calcIAF(signalEC,signalEO,freq)
    IAFVec=signalEC-signalEO;
    [maxDifVal,maxIndex]=max(IAFVec);
    freqValMax = freq(maxIndex);
end
