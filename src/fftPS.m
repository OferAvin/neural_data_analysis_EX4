function spectorVecShift = fftPS(signal)
    spectromVecComplex = fft(signal);  
    spectromVec = spectromVecComplex/length(spectromVecComplex);
    spectromVecNorm = abs(spectromVec).^2;
    spectorVecShift = fftshift(spectromVecNorm);
end