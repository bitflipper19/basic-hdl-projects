# basic-hdl-projects
Learning about git, github and hardware modelling using verilog.

## To compile a code 
```iverilog -o {target_file_name} {file_name}.v {file_name}-tb.v```
## To view the terminal simulation
```vvp {target_file_name}```
## To view the gtkWave simulation
```gtkwave {file_name}.vcd```
### Note: All -tb.v files are testbench files, one testbench file for all implementations
