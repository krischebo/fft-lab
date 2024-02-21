% WEIGHTED_MEAN − Calculate weighted mean for an array of tuples
%
% mean = weighted_mean (F, V)
%
% F is the frequencies in order of strength
% V is the magnitude of the FFT for each frequency
%
function mean = weighted_mean(f, v)
  total = 0;
  for i = 1:length(f)  % Iterate over the length of f
    total = total + f(i) * v(i);  % Multiply each frequency by its corresponding magnitude and accumulate
  end
  mean = total / sum(v);  % Divide by the sum of magnitudes to get the weighted mean
end



