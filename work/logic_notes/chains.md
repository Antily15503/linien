# Chains

## Arguments

- `width` defines width of input signal.
- `signal_width` defines additional headroom allocated to avoid overflow during
  multiplication/summation.
- `mod` is the `Modulate` object passed as an argument.
- `coeff_width` **TODO**
- `offset_signal` is summed with  input signal `dy` truncated to 14 bits.

## Process

- `out_q` is given as the quadrature of the input signal
  - recall that quadrature refers to determining the phase and frequency of a given signal relative to a reference.
  - multiplying two signals yields the sum and difference in the frequency domain
  - integral over time zeros the AC component (sum of frequency) and accumulates the DC component (difference of frequency). Low pass filter can determine how "similar" the two frequencies are (higher magnitude -> more of the same frequency).
  - product of sinusoids carries over phase relationship; if the two signals have the same frequency but are out of phase by 90 degrees, DC component evaluates to cos(-90)=0.
  - performing the same steps at above but intentionally imparting a phase difference of 90 degrees allows the user to tell if the signal is just off-phase or if its off-frequency, being able to discriminate between the two.  `out_i,out_q`

- gets a signal from the ADC, `x`, and passes it through a number of filters
  - `demod` demodulates the signal from the ADC
  - `x_limit`: CSR programmable clamping/filtering and flagging of railing
  - `iir_c`: first order IIR filter, likely to reduce noise
  - iir_d: second order IIR filter, again to reduce noise
- **NOTE**: structured so that output can be tapped from any of the previous stages, given by `y_tap`
  - y_tap can select from raw input (`iir_x` ), post-first order IIR filter (`iir_c.y` ) or post second order IIR filter (`iir_d.y` )
