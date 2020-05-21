function[spectorVecShift] =  fftPS(data,condition,curSubject,electrodeNum)
        dataVec = data.(curSubject).(condition).record(electrodeNum,:);
        spectromVecComplex = fft(dataVec);  
        spectromVec = spectromVecComplex/norm(spectromVecComplex);
        spectromVecNorm = abs(spectromVec).^2;
        spectorVecShift = fftshift(spectromVecNorm);
        
end