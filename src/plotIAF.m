%this function calculating the IAF and plots it for each method 
function plotIAF(f,fftSpecEC,pWelchEC,dftEC,fftSpecEO,pWelchEO,dftEO,subNum,fftFreq,dftFreq)
    %find IAF for each method
    [fftIAF,fftMaxDifVal,fftFreqValMax]= calcIAF(fftSpecEC,fftSpecEO,fftFreq);
    [pwelchIAF,pwelchMaxDifVal,pwelchFreqValMax]= calcIAF(pWelchEC,pWelchEO,f);
    [dftIAF,dftMaxDifVal,dftFreqValMax]= calcIAF(dftEC,dftEO,dftFreq);
    
    figure('Name',[num2str(subNum) 'IAF'],'units','normalized','position' ,[0 0 1 1]);
    
    title1 = "Subject " + num2str(subNum) + newline + "Difference spectrum (EC - EO) using: ";
    sgtitle(title1);
    
    subplot(3,1,1);
    plot(fftFreq,fftIAF,'Color','b');
    hold on;
    line([fftFreqValMax fftFreqValMax],[0 fftMaxDifVal],'Color','red','LineStyle','--',...
    'DisplayName','IAF')
    title("fft");
    ylim([0 max(fftSpecEC)]);
    ylabel("Power",'FontSize',11);
    xlabel("Frequency[Hz]",'FontSize',11);
    legend('difference','IAF');
    hold off;
    
    subplot(3,1,2);
    plot(f,pwelchIAF,'Color','b');
    hold on;
    line([pwelchFreqValMax pwelchFreqValMax],[0 pwelchMaxDifVal],'Color','red','LineStyle','--',...
    'DisplayName','IAF')
    title("pwelch");
    ylim([0 max(pWelchEC)]);
    ylabel("Power",'FontSize',11);
    xlabel("Frequency[Hz]",'FontSize',11);
    hold off;
    
    subplot(3,1,3);
    plot(dftFreq,dftIAF,'Color','b');
    hold on;
    line([dftFreqValMax dftFreqValMax],[0 dftMaxDifVal],'Color','red','LineStyle','--',...
    'DisplayName','IAF')
    title("DFT");
    ylim([0 max(dftEC)]);
    ylabel("Power",'FontSize',11);
    xlabel("Frequency[Hz]",'FontSize',11);
    hold off;
end
