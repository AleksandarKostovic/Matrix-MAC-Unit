//===========================================//
//  Copyright (c) Aleksandar Kostovic 2018   //
//    Matrix Multiply and Accumulate unit    //
//===========================================//

`timescale 1 ns / 1 ps 

module matrix_mac_unit #(
   parameter DATA_WIDTH = 8
)(
//inputs
   input       [DATA_WIDTH-1:0]               clock,
   input       [DATA_WIDTH-1:0]               reset,
   input       [DATA_WIDTH-1:0]              enable,
   input       [DATA_WIDTH-1:0]               clear,
   input logic [DATA_WIDTH-1:0] matrix_1 [0:3][0:3],
   input logic [DATA_WIDTH-1:0] matrix_2 [0:3][0:3],

//outputs
   output [DATA_WIDTH-1:0]         result [0:3][0:3]
);

//logic
   logic [DATA_WIDTH-1:0]    accumulator [0:3][0:3];
    
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
   
//combinational logic
assign result = enable ? matrix_1 * matrix_2 + accumulator : accumulator;

endmodule
