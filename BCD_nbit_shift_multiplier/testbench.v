`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2025 18:08:49
// Design Name: 
// Module Name: testbench_BCD_nbit_shift_multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench_BCD_nbit_shift_multiplier(
    );
    parameter n_bits =5;
    // Inputs
    reg [n_bits-1:0] a_in;
    reg [n_bits-1:0] b_in;
    reg clk;
    reg start;
    reg reset;
    
    
    // Outputs
    wire [(n_bits*2)-1:0] out;
    wire finish;
    wire [(((n_bits*2)/3)+1)*4-1:0] bcd;
    
    // Instantiate the ddesign under test (DUT)
    
    nbit_shift_multiplier uut (
    .out(out),
    .a_in(a_in),
    .b_in(b_in),
    .clk(clk),
    .start(start),
    .reset(reset),
    .finish(finish),
    .bcd(bcd)
    );
    
    defparam uut.N = n_bits;
    
    initial
    begin
    forever
    #50 clk=~clk;
    end
    
    initial begin
    // Initialize Inputs
    a_in =0;
    b_in =0;
    clk=0;
    start=0;
    reset=1;
    
    // Wait 100ns for global reset to finish
    #100;
    
    reset =0;
    a_in ='d26;
    b_in='d30;
    start =0;
    #200
    start = 1;
    #(100*n_bits)
    a_in ='d13;
    b_in ='d13;
    start =0;
    #200
    start =1;
    #(100*n_bits)
    $finish;
    end
    
endmodule
