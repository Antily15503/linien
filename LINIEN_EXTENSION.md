## Documentation and Usage of extended linien

#### What
This fork of linien is an extension of base linien that allows for the interrupt, driving of user-programmable waveforms and then relocking via restoration of pre-trigger signals and calling of the relock function

This is achieved via the instantiation of a seperate module on the PL side that handles generation of waveforms, and the handoff from-and-to linien. 
the PL side (majority of which is defined under the src directory) is highly modularized, allowing for changes to the number of waveforms in a sequence, size of the DAC (assumed to be 14 bits), and more. 

#### Important notes
Due to stock-liniens large resource utilization on the PL side, the **robust autolock** block had to be removed to make space for the arbitrary waveform generator. All
autolock calls will default to fast autolock, and setting Robust on the GUI will **not work**
This restriction *might* be lifted if linien is running on the 7020 red pitaya (instead of the assumed 7010) due to its larger resource pool, but **this has not been tested**

#### Setting up the environment to use extended-linien

The linux environment was already established on the desktop being used in the 202-lab.
To access this environment, run wsl -d Ubuntu to launch the windows-subsystem for linux, using the ubuntu environment. 
This should launch a shell, with its directory being mnt/{something}. 
Since this version of linien is intended to work with a linux-like file system, all work was done in the **root directory**: this is accessed via "cd ~"
in this directory, the linien folder should be visible. this is where all the programming will be done. 

#### First-time/post reset setup of extended-linien
if this is the first time this version of linien is being used, OR the red-pitaya has been reset, these steps will be required. 
for some background, extended-linien differs to stock-linien in a couple of main aspects. 

##### Gateware.bin
bitstream that "configres" the PL/FPGA side: most fundamental/important file. Using or launching stock linien will "reflash" the FPGA with the "normal" gateware.bin, erasing its 
ability to generate arbitrary waveforms that this fork implements. 

##### CSR's
CSR's stand for *control and status registers*. this is the fundamental way that the PS/embedded side and PL/FPGA side are able to communicate. extended-linien introduces several new CSR's to 
control writes to the instruction and arbitrary-waveform registers, which stock-linien lacks. 

##### Write Functions 
the server-client communication has been extended by introducing 2 new functions (so far): write_sequence_config and write_awg. The former writes the sequence of instructions to the instruction-register on the FPGA, and the latter writes values into the arbitrary waveform generator. 

there are several other aspects that diverge from stock-linien, but these are the most important. 
from here on, "server side" refers to the linien running on the red-pitaya, and client refers to the 
linien running on the desktop. 

To deploy extended-linien, run the deploy.sh script in the linien directory via "bash deploy.sh"
this will copy over the client side files to the server side, effectively updating it with the new
gateware, CSR files and write functions. 

#### Loading functions
after extended-linien has been flashed/uploaded onto the server, arbitrary waveforms can be 
loaded onto the red pitaya. These are executing upon a ttl signal being provided to the appropriate input pin

To write a sequence to the red-pitaya, look at the drive_sequence.py file for reference.

some important lines to note are the following
##### client.parameters.sequence_blocks.value
accesses the client sides parameters, where the sequence_blocks is defined. 
parameters is the main method by which the client side and server side communicate. 
from drive_sequence.py, it should be evident how instructions are formatted; 
a list of dictionaries, where each entry in the list defines a waveform to drive (and all its corresponding parameters)

##### client.control.write_sequence_config
an important function that writes the contents of client.parameters.sequence_blocks.value *into* the 
FPGA, allowing it to perform the set of instructions. after any update to sequence_blocks, write_sequence_config **must**
be called to update the sequence that the FPGA would drive upon a ttl pulse

##### write_awg
a function still in testing, but takes in a 1024 long sequence of values (between -8912 and 8191) and loads them
into the AWG to be used. **STILL IN TESTING**

#### Instruction write format

     type 0 (delay):       2  (hold_voltage, duration)
     type 1 (linear_ramp): 3  (v_start,clk_div, step_size, duration)
     type 2 (direct_jump): 2  (target_voltage, duration)
     type 3 (chirp):       5  (a, b, rate, raterate, duration)
     type 4 (sinusoid):    6  (v_mid, v_amp, v_min_cut, v_max_cut, phase_inc, duration)
     type 5 (arb_wfm):     4  (clk_div, length, duration) <- ps should calculate how long the awg will take (if it is used) and pass that into the fsm as duration signal.

The table above represents the order in which parameters should be provided to sequence_blocks.value. 



