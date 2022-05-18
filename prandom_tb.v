`timescale 1ns/1ps
module  Prandom_tb();
reg clk;
reg rst;
wire[2:0] Q;

  parameter PERIOD  = 20;
  parameter real DUTY_CYCLE  = 0.5;
  parameter OFFSET  = 0;
  initial
  begin
      #OFFSET;
      forever
      begin
        clk = 1'b1;
        #(PERIOD-(PERIOD*DUTY_CYCLE))
        clk = 1'b0;
        #(PERIOD*DUTY_CYCLE);
        end
      end
    initial begin
          rst = 1;
      #5 rst = 0;
      #250 $finish;
    end
    initial
    begin
          $dumpfile("Prandom.vcd");
          $dumpvars(0,Prandom_tb);
    end
    Prandom Prandom_tb( .clk(clk), .rst(rst), .Q(Q));
    endmodule
