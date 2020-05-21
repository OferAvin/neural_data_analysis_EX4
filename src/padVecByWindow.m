function toPad = padVecByWindow(toPad,windSize,overlap,fs)
    ln = length(toPad);
    windInTP = windSize*fs;
    windLengthContrib = floor(windInTP - windInTP*overlap/100);
    spare = mod((ln-windInTP),windLengthContrib);
    if spare ~= 0
        zerToAdd = windLengthContrib - mod((ln-windInTP),windLengthContrib);
        toPad = [toPad zeros(1,zerToAdd)];
    end
end