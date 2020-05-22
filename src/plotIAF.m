function plotIAF(f,fftSpecEC,pWelchEC,dftEC,fftSpecEO,pWelchEO,dftEO,i,freqValsEC,cond)
    
    [fftIAF,fftMaxDifVal,fftFreqValMax]= calcIAF(fftSpecEC,fftSpecEO,freqValsEC);
    [pwelchIAF,pwelchMaxDifVal,pwelchFreqValMax]= calcIAF(pWelchEC,pWelchEO,f);
    [dftIAF,dftMaxDifVal,dftFreqValMax]= calcIAF(dftEC(1:length(f)),dftEO(1:length(f)),f);
    
    
    figure();
    sgtitle(char("Subject " + i + " Difference spectrum using: "));
    subplot(1,3,1);
    plot(freqValsEC,fftIAF,'Color','b');
    hold on;
    line([fftFreqValMax fftFreqValMax],[0 fftMaxDifVal],'Color','red','LineStyle','--',...
    'DisplayName','IAF')
    title("fft");
    ylim([0 inf]);
    ylabel("Power",'FontSize',13);
    xlabel("Frequency[Hz]");
    hold off;
    
    subplot(1,3,2);
    plot(f,pwelchIAF,'Color','b');
    hold on;
    line([pwelchFreqValMax pwelchFreqValMax],[0 pwelchMaxDifVal],'Color','red','LineStyle','--',...
    'DisplayName','IAF')
    title("pwelch");
    ylim([0 inf]);
    xlabel("Frequency[Hz]");
    hold off;
    
    subplot(1,3,3);
    plot(f,dftIAF(1:length(f)),'Color','b');
    hold on;
    line([dftFreqValMax dftFreqValMax],[0 dftMaxDifVal],'Color','red','LineStyle','--',...
    'DisplayName','IAF')
    title("DFT");
    ylim([0 inf]);
    xlabel("Frequency[Hz]");
    legend(cond(1),cond(2));
    hold off;
end
