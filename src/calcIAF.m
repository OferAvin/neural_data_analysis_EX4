function calcIAF(signalEC,signalEO,method,subjectNum)
    diffSpectrum=signalEO-signalEO;
    [IAF,maxIndex]=max(diffSpectrum);
    figure('Name',strcat('Difference spectrum using'," ",method,...
    ' for subject'," ",num2str(subject)));
    hold on;
    xlabel('Frequency(Hz)')
    ylabel(strcat('Power Spectrum'," ",units))
    
    
end
