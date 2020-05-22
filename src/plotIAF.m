function plotIAF(fftIAF,fftMaxDifVal,fftFreqValMax,pwelchIAF,pwelchMaxDifVal,pwelchFreqValMax,...
    dftIAF,dftMaxDifVal,dftFreqValMax,subNum)
    figure();
    sgtitle(char("Subject " + subNum + "Difference spectrum using: "));
    subplot(1,3,1);
    plot(fftIAF,'Color','b');
    hold on;
    line([fftFreqValMax fftFreqValMax],[0 fftMaxDifVal],'Color','red','LineStyle','--',...
    'DisplayName','IAF')
    title("fft");
    hold off;
    
    subplot(1,3,2);
    plot(f,pwelchIAF,'Color','b');
    hold on;
    line([pwelchFreqValMax pwelchFreqValMax],[0 pwelchMaxDifVal],'Color','red','LineStyle','--',...
    'DisplayName','IAF')
    title("pwelch");
    hold off;
    
    subplot(1,3,3);
    plot(f,dftIAF(1:length(f)),'Color','b');
    hold on;
    line([dftFreqValMax dftFreqValMax],[0 dftMaxDifVal],'Color','red','LineStyle','--',...
    'DisplayName','IAF')
    title("DFT");
    legend("EC","EO");
    hold off;
end
