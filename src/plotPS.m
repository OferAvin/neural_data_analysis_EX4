function plotPS(f,fft1,pwelch1,dft1,fft2,pwelch2,dft2)
    figure();
    subplot(1,3,1);
    plot(fft1,'Color','b');
    hold on;
    plot(fft2,'Color','r');
    hold off;
    subplot(1,3,2);
    plot(f,pwelch1,'Color','b');
    hold on;
    plot(f,pwelch2,'Color','r');
    hold off;
    subplot(1,3,3);
    plot(f,dft1(1:length(f)),'Color','b');
    hold on;
    plot(f,dft2(1:length(f)),'Color','r');
    hold off;
end