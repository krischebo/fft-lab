% STRONG_FREQ − Extract the strongest frequencies from a signal
%
% [F, V] = strong_freq (Y, FS, N)
% [F, V] = strong_freq (Y, FS, N, NUM)
%
% Y is the signal data to analyze
% FS is the sampling rate (samples per second)
% N is the window size to use
% NUM is the number of values to report (default 5)
%
% F is the frequencies in order of strength
% V is the magnitude of the FFT for each frequency
%
function [f,v] = strong_freq( y, fs, N, num=5 )
  window = blackman( N );
  freq = fft( y(1:N).*window );

  % We only need to sort the first half of the freq data
  % since it is symmetric.
  [sorted, idx] = sort( abs(freq(1:N/2)), 'descend' );

  f = (idx(1:num) - 1)/N*fs;
  v = sorted(1:num);
end
