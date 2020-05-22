function plotPS(f,fft1,pwelch1,dft1,fft2,pwelch2,dft2,subNum)
    figure();
    sgtitle(char("Subject " + subNum + " Power Spectrum calculated by:"));
    subplot(1,3,1);
    plot(fft1,'Color','b');
    hold on;
    plot(fft2,'Color','r');
    title("fft");
    hold off;
    
    subplot(1,3,2);
    plot(f,pwelch1,'Color','b');
    hold on;
    plot(f,pwelch2,'Color','r');
    title("pwelch");
    hold off;
    
    subplot(1,3,3);
    plot(f,dft1(1:length(f)),'Color','b');
    hold on;
    plot(f,dft2(1:length(f)),'Color','r');
    title("DFT");
    legend("EC","EO");
    hold off;
end