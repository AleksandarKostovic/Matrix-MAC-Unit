//===========================================//
//  Copyright (c) Aleksandar Kostovic 2018   //
//    Matrix Multiply and Accumulate unit    //
//===========================================//

`timescale 1ns / 1ps 

import mmac_pkg::*;

/*--------------------------MATRIX MULTIPLY-----------------------------*/

module matrix_multiply_unit(
    
    input  logic [DATA_WIDTH-1:0] matrixA, //|<i
    input  logic [DATA_WIDTH-1:0] matrixB, //|<i
    output logic [DATA_WIDTH-1:0] result   //|>o
);
    //internal variables 
    logic [VAR_WIDTH-1:0] A1 [0:M_SIZE-1][0:M_SIZE-1];
    logic [VAR_WIDTH-1:0] B1 [0:M_SIZE-1][0:M_SIZE-1];
    logic [VAR_WIDTH-1:0] Res1 [0:M_SIZE-1][0:M_SIZE-1]; 
    int i,j,k;

    always_ff @ (matrixA or matrixB)
    begin
    //Initialize the matrices-convert 1 D to 3D arrays
        {A1[0][0],A1[0][1],A1[1][0],A1[1][1],A1[1][2],A1[2][1],A1[2][0],A1[0][2],A1[2][3],A1[3][2],A1[3][0],A1[0][3],A1[3][1],A1[1][3]} = matrixA;
        {B1[0][0],B1[0][1],B1[1][0],B1[1][1],B1[1][2],B1[2][1],B1[2][0],B1[0][2],B1[2][3],B1[3][2],B1[3][0],B1[0][3],B1[3][1],B1[1][3]} = matrixB;
        i = 0;
        j = 0;
        k = 0;
        {Res1[0][0],Res1[0][1],Res1[1][0],Res1[1][1],Res1[1][2],Res1[2][1],Res1[2][0],Res1[0][2],Res1[2][3],Res1[3][2],Res1[3][0],Res1[0][3],Res1[3][1],Res1[1][3]} = 32'd0; //initialize to zeros.
        //Matrix multiplication
        for(i=0;i < 4;i=i+1)
            for(j=0;j < 4;j=j+1)
                for(k=0;k < 4;k=k+1)
                    Res1[i][j] = Res1[i][j] + (A1[i][k] * B1[k][j]);
        //final output assignment - 3D array to 1D array conversion.            
        result = {Res1[0][0],Res1[0][1],Res1[1][0],Res1[1][1],Res1[1][2],Res1[2][1],Res1[2][0],Res1[0][2],Res1[2][3],Res1[3][2],Res1[3][0],Res1[0][3],Res1[3][1],Res1[1][3]};            
    end 
endmodule

/*--------------------------MATRIX ACCUMULATE-----------------------------*/

module matrix_accumulate_unit(

    input clock,                           //|<i
    input reset,                           //|<i
    input clear,                           //|<i
    input enable,                          //|<i
    input  logic [DATA_WIDTH-1:0] result,  //|<i
    output logic [DATA_WIDTH-1:0] out      //|>o    
); 

//internal register
logic [DATA_WIDTH-1:0] accumulator;

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

assign out = enable ? result + accumulator : accumulator;

endmodule 
