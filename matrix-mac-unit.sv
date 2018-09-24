//===========================================//
//  Copyright (c) Aleksandar Kostovic 2018   //
//    Matrix Multiply and Accumulate unit    //
//===========================================//

`timescale 1 ns / 1 ps 

module matrix_mac_unit #(
    parameter DATA_WIDTH = 8
)( //ports
    clock,         //|<i
    reset,         //|<i
    enable,        //|<i
    clear,         //|<i
    matrix_1,      //|<i
    matrix_2,      //|<i
    result         //|>o 
);

//inputs
input     [DATA_WIDTH-1:0]     clock;
input     [DATA_WIDTH-1:0]     reset;
input     [DATA_WIDTH-1:0]    enable;
input     [DATA_WIDTH-1:0]     clear;
input [DATA_WIDTH-1:0]  matrix_1;
input [DATA_WIDTH-1:0]  matrix_2;

//outputs
output [DATA_WIDTH-1:0]       result;

//reg
logic [DATA_WIDTH-1:0]     accumulator;
    
//combinational logic

//sequential logic
    always_ff @(posedge clock) begin
      if (!reset) begin
          accumulator <= 0;
      end
      else if (clear) begin
          accumulator <= 0;
      end
      else begin
          accumulator <= result;
      end

    end
endmodule
