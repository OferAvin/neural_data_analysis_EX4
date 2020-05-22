function [spectorVecShift,freqVal] = fftPS(signal,fs,f)
    n=length(signal);
    freqVal=0:fs/n:fs/2;
    range=(freqVal>f(1) & freqVal<f(end));
    freqVal=freqVal(range);
    spectromVecComplex = fft(signal);  
    spectromVec = spectromVecComplex/length(spectromVecComplex);
    spectromVecNorm = abs(spectromVec).^2;
    spectromInRange = spectromVecNorm(range);
    spectorVecShift = fftshift(spectromInRange);
end