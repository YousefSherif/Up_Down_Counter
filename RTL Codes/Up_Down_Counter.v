module Up_Down_Counter #(parameter DATA_WIDTH = 3'd5) (
  input  wire                     i_clk     ,
  input  wire                     i_rst_n   ,
  input  wire [DATA_WIDTH - 1:0]  i_in      ,
  input  wire                     i_load    ,
  input  wire                     i_up      ,
  input  wire                     i_down    ,
  output reg  [DATA_WIDTH - 1:0]  o_counter ,
  output wire                     o_high    ,
  output wire                     o_low
  );

 reg [DATA_WIDTH - 1:0] counetr_r ;

always@(posedge i_clk or negedge i_rst_n) begin
  if(!i_rst_n) begin
    o_counter <= 'd0 ;
  end
  else begin
    o_counter <= counetr_r ;
  end
end

always@(*) begin
  if(i_load) begin
    counetr_r = i_in ;
  end
  else if(i_up && !o_high) begin
    counetr_r = o_counter + 1'b1 ;
  end
  else if(i_down && !o_low && !i_up) begin
    counetr_r = o_counter - 1'b1 ;
  end
  else begin
    counetr_r = o_counter ;
  end
end
 
assign o_high = (o_counter ==  {DATA_WIDTH{1'b1}}) ;
assign o_low  = (o_counter ==  {DATA_WIDTH{1'b0}}) ;

endmodule
