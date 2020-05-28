%this function plots all power spectrums by fft pwelch and dft 
%each figure represents a subject, both conditions are shown in the same plot
%all spectrums shown are in the f frequencies range.
function plotPS(f,fft1,pwelch1,dft1,fft2,pwelch2,dft2,subNum,fftFreq,dftFreq,cond)
    figure('Name',[num2str(subNum) 'PS'],'units','normalized','position' ,[0 0 1 1]);
    
    sgtitle(char("Subject " + subNum + " Power Spectrum calculated by:"));
    subplot(3,1,1);
    plot(fftFreq,fft1,'Color','b');
    hold on;
    plot(fftFreq,fft2,'Color','r');
    title("fft");
    ylabel("Power",'FontSize',11);
    xlabel("Frequency[Hz]",'FontSize',11);
    legend(cond(1),cond(2));
    hold off;
    
    subplot(3,1,2);
    plot(f,pwelch1,'Color','b');
    hold on;
    plot(f,pwelch2,'Color','r');
    title("pwelch");
    ylabel("Power",'FontSize',11);
    xlabel("Frequency[Hz]",'FontSize',11);
    hold off;
    
    subplot(3,1,3);
    plot(dftFreq,dft1,'Color','b');
    hold on;
    plot(dftFreq,dft2,'Color','r');
    title("DFT");
    ylabel("Power",'FontSize',11);
    xlabel("Frequency[Hz]",'FontSize',11);
    hold off;
end