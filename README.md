In this lab assignment, we must decode a sound file (.wav) using fast Fourier transforms. Here is the complete homework assignment:

Way before the internet, we used to use a device called a modem to communicate between
computers. My first modem was a 300-baud modem, which could transfer 300 bits of
information per second. It did this by transmitting one of two different tones.
When it needed to transmit a 0 bit, a modem played a tone called SPACE which was 1070
Hz. When it needed to transmit a 1 bit, it transmitted a MARK which was 1270 Hz. When
no data was transmitted, the modem was left in the MARK state.

I have encoded a message according to that old convention and saved it as a one-second
wave file. For your convenience, I’ve included both a high-resolution 44100 sample file and
a smaller 11025 sample file. Both are monaural (not stereo).

Each byte is transmitted the highest bit first, but, before any bit is sent, the modem transmits
a “start bit” which is one bit of the SPACE tone to synchronize things. After the start bit, the
most significant bit is sent, then the next, until all 8 bits have been transmitted. When the
final bit has been sent, a “stop bit” follows (one bit of the MARK tone).

Details of this transmission protocol are on Wikipedia:
https://en.wikipedia.org/wiki/Universal_asynchronous_receiver-transmitter

My message contains 6 ASCII characters. Your task is to decode them.

This repository contains my solution to the problem.
