function dftResults = dftPs(signal,window,overlap)
k = 1:window;
n = 1:window;
W = exp(-2.*pi.*1i.*n'*k/window);
windMetrix = buffer(signal,window,overlap,'nodelay');
dftMetrix = W*windMetrix;
dftMetrix = dftMetrix/window;
dftMetrix = dftMetrix.^2;
dftMetrix = abs(dftMetrix);
dftResults = mean(dftMetrix,2);
end
