# VHDLCompilateur
### Overview
Project.vhd is the main file since it implements all the components (instruction memory, decoder, processor and data memory), which means once you run the simulation you will have access to all the signals of all the components.

### How to run the processor:
<ol>
<li>Download the git repository.</li>
<li>Make sure the .asm file is in the work directory.</li>
<li>Simulate the ProjectTB file.</li>
<li>Add signals to the graph (we recommend the decoder signals, the first 4 registers and the memory addresses used in the .asm file).</li>
</ol>

### How to run your own .asm code
<ol>
<li>Open the .asm file in the directory.</li>
<li>Add your own Asm instructions by following the format: op_code (4 bits) A (8 bits) B (8 bits) C (8 bits).</li>
</ol>

Example: 
LOAD R0 127 -> 7007F00

### Attention:
<ul>
<li>The NOP instruction equals "0000000".</li>
<li>We suggest that the first instruction of your .asm file is a NOP.</li>
<li>The 15nth operator (JMPC) is not implemented.</li>
<li>The alea unit management is not implemented, so you must insert NOPs manually.</li>
<li>Our data memory has a maximum size of 255 (8 bits). As a result the LOAD and STORE instructions have parameters of only 8 bits</li>
</ul>
