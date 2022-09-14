# Up_Down_Counter
This is the Verilog code and synthesis output of my parameterized up-down counter.

My Design:
 - The counter counts value loaded from the "i_in" port on a positive clock edge when the "i_load" signal is high, i_load has the highest priority
 - The counter counts the value incremented by 1 on a positive clock edge when the "i_up" signal is high.
 - The counter counts the value decremented by 1 on a positive clock edge when the "i_down" signal is high, i_up has higher priority than the i_down signal
 - Increment stops at 31
 - Decrement stops at 0
 - The "o_high" flag active high whenever count value is 31
 - The "o_low" flag active high whenever count value is 0

Block Diagram:
