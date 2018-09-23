//===========================================//
//  Copyright (c) Aleksandar Kostovic 2018   //
//    Matrix Multiply and Accumulate unit    //
//===========================================//

module matrix_mac_unit #(
    parameter DATA_WIDTH = 8
)( //ports
    clock,         //|<i
    reset,         //|<i
    enable,        //|<i
    clear,         //|<i
    matrix_1,      //|<i
    matrix_2       //|<i
    result         //|>o 
);

//inputs
input [DATA_WIDTH-1:0]     clock;
input [DATA_WIDTH-1:0]     reset;
input [DATA_WIDTH-1:0]    enable;
input [DATA_WIDTH-1:0]     clear;
input [DATA_WIDTH-1:0]  matrix_1;
input [DATA_WIDTH-1:0]  matrix_2;

//outputs
output [DATA_WIDTH-1:0]   result;

//reg
reg [DATA_WIDTH-1:0] accumulator;

//sequential logic

//combinational logic


endmodule
