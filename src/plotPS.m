function plotPS(f,fft1,pwelch1,dft1,fft2,pwelch2,dft2,subNum,freqValsEC,freqValsEO,cond)
    figure();
    sgtitle(char("Subject " + subNum + " Power Spectrum calculated by:"));
    subplot(1,3,1);
    plot(freqValsEC,fft1,'Color','b');
    hold on;
    plot(freqValsEO,fft2,'Color','r');
    title("fft");
    ylabel("Power",'FontSize',13);
    xlabel("Frequency[Hz]");
    hold off;
    
    subplot(1,3,2);
    plot(f,pwelch1,'Color','b');
    hold on;
    plot(f,pwelch2,'Color','r');
    title("pwelch");
    xlabel("Frequency[Hz]");
    hold off;
    
    subplot(1,3,3);
    plot(f,dft1(1:length(f)),'Color','b');
    hold on;
    plot(f,dft2(1:length(f)),'Color','r');
    title("DFT");
    xlabel("Frequency[Hz]");
    legend(cond(1),cond(2));
    hold off;
end