%this function calculates dft, it creates a complexed matrix and splits the
%signal into windows. it multiples the two matrices. the result matrix is
%normelized the mean is taken as result of the dft
function dftResults = dftPS(signal,window,overlap)
    k = 0:window-1;
    n = 0:window-1;
    W = exp(-2.*pi.*1i.*n'*k/window);                       %creates complex matrix
    windMetrix = buffer(signal,window,overlap,'nodelay');   %creates all windows matrix
    dftMetrix = W*windMetrix;
    dftMetrix = dftMetrix/window;
    dftMetrix = dftMetrix.^2;
    dftMetrix = abs(dftMetrix);
    dftResults = mean(dftMetrix,2);
end
 