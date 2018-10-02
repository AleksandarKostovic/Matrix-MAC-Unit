//===========================================//
//  Copyright (c) Aleksandar Kostovic 2018   //
//    Matrix Multiply and Accumulate unit    //
//===========================================//

`timescale 1ns / 1ps 

import mmac_pkg::*;

module matrix_mac_unit
(//ports
   
   input  clock,
   input  reset,
   input  enable,
   input  clear,
   input  logic [DATA_WIDTH-1:0] matrix_1,
   input  logic [DATA_WIDTH-1:0] matrix_2,
   output logic [DATA_WIDTH-1:0] result
);

//logic
   logic [DATA_WIDTH-1:0] accumulator;
    
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
