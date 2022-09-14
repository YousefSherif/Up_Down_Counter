`timescale 1ns/1ps

module Up_Down_Counter_tb () ;
  
  parameter DATA_WIDTH_tb = 3'd5 ;

  reg                         i_clk_tb     ;
  reg                         i_rst_n_tb   ;
  reg  [DATA_WIDTH_tb - 1:0]  i_in_tb      ;
  reg                         i_load_tb    ;
  reg                         i_up_tb      ;
  reg                         i_down_tb    ;
  wire [DATA_WIDTH_tb - 1:0]  o_counter_tb ;
  wire                        o_high_tb    ;
  wire                        o_low_tb     ;

initial begin
  i_clk_tb   = 1'b0 ;
  i_rst_n_tb = 1'b1 ;
  i_load_tb  = 1'b0 ;
  i_in_tb    = 'd7  ;
  i_up_tb    = 1'b0 ;
  i_down_tb  = 1'b0 ;
#50
  i_rst_n_tb = 1'b0 ;
#150
  i_rst_n_tb = 1'b1 ;
  i_load_tb  = 1'b1 ;
  i_up_tb    = 1'b1 ;
#150
  i_load_tb  = 1'b0 ;
#3000
  if (o_high_tb) begin
    $display ("The counter reached its final value.") ;  
  end
  else if(o_low_tb) begin
    $display ("The counter is zero.") ;
  end
#50
  i_rst_n_tb = 1'b1 ;
#50
  i_rst_n_tb = 1'b0 ;
#150
  i_rst_n_tb = 1'b1 ;
  i_load_tb  = 1'b1 ;
  i_up_tb    = 1'b0 ;
  i_down_tb  = 1'b1 ;
#150
  i_load_tb  = 1'b0 ;
#3000
  if (o_high_tb) begin
    $display ("The counter reached its final value.") ;  
  end
  else if(o_low_tb) begin
    $display ("The counter is zero.") ;
  end
// $finish ;
end

always #50 i_clk_tb = ! i_clk_tb ;

Up_Down_Cointer #(.DATA_WIDTH(DATA_WIDTH_tb)) DUT (
 .i_clk(i_clk_tb)          ,
 .i_rst_n(i_rst_n_tb)      ,
 .i_in(i_in_tb)            ,
 .i_load(i_load_tb)        ,
 .i_up(i_up_tb)            ,
 .i_down(i_down_tb)        ,
 .o_counter(o_counter_tb)  ,
 .o_low(o_low_tb)          ,
 .o_high(o_high_tb)
  );

endmodule
