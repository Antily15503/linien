## Features to implement for MOT self lock

- change one of the jump functions from relative to absolute
  - possibly done by ignoring i_init_v_drive inside of control.sv?
- implement software classes to encapsulate data
- implement software class to orchestrate the run
- implement hardware required to perform the following
  - mot_lock_ttl -> intercepted by software -> loads instructions into FSM -> triggers ttl *from software* -> somehow "reads" data from the ADC -> move onto the next stage -> repeat
  - requires additional CSR to say "finished the sequence" so PS knows data is valid to read
- jump back to same phase of triangle wave generated when no error signal is present(?)
  - determine how/where the triangle wave is generated, see if its possible to "pause" it
  so the jump back will be in phase with the triangle wave?
