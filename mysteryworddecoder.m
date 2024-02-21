function mysteryworddecoder()
  % Loading audio file
  [y, fs] = audioread('trans.wav');

  % Declaring parameters and constants
  space_freq = 1070;
  mark_freq = 1270;
  baud_rate = 300;
  samples_per_bit = round(fs/baud_rate);
  window_size = samples_per_bit;
  decoded_bits = []; % Used to append 0s and 1s

  % Windowing choice
  window = blackman(window_size);

  for current_sample = 1:samples_per_bit:length(y)
    % Creating a segment to analyze
    chunk = y(current_sample:current_sample+samples_per_bit-1);
    % Applying window
    windowed_chunk = chunk .* window;

    % Fourier transforming windowed_chunk
    freq_domain = fft(windowed_chunk);
    [f, v] = strong_freq(windowed_chunk, fs, window_size, 5);
    weighted_freq = weighted_mean(f, v);

    % Decode bit based on dominant frequency
    if abs(weighted_freq - space_freq) <= 100
      decoded_bits = [decoded_bits, 0];
    elseif abs(weighted_freq - mark_freq) <= 100
      decoded_bits = [decoded_bits, 1];
    end
  end

  % Removing end of decoded_bits so that we have something divisible by 10
  remainder = mod(length(decoded_bits),10);
  usable_columns = length(decoded_bits)-remainder;
  decoded_bits = decoded_bits(:, 1:usable_columns);
  % disp(decoded_bits); % Working!

  % Processing decoded_bits and placing into another matrix
  % Final result will have a matrix a character in binary form in one row
  decoded_bits_matrix = [];
  temp_arr = [];
  for i = 1:10:length(decoded_bits)-10
    if decoded_bits(i) == 0
      temp_arr = decoded_bits(i+1:i+8);
      decoded_bits_matrix = [decoded_bits_matrix; temp_arr];
    endif
  endfor

  % Testing output
  % disp(decoded_bits_matrix); % Working!

  % Converting binary matrix to ASCII characters
  message = ''; % Initialize empty string to hold ASCII characters
  for i = 1:size(decoded_bits_matrix, 1) % Iterate over each row of the binary matrix
    % Convert binary digits to decimal value
    decimal_value = bin2dec(num2str(decoded_bits_matrix(i, :)));
    % Convert decimal value to ASCII character and append to string
    message = [message, char(decimal_value)];
  end
  message
end


