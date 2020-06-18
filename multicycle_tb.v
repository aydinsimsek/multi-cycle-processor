module multicycle_tb (); 
reg CLK, reset;
reg RESET,RUN;  
reg [7:0] Resultexpected;
reg [3:0] CurrentStateexpected;     
wire [7:0] Result;
wire [3:0] CurrentState;
reg [31:0] vectornum, errors; // bookkeeping variables    
reg [13:0] testvectors[9999:0]; // array of testvectors
// instantiate device under test
multicycle dut(CLK,RESET,RUN,Result,CurrentState);
// generate clock
always // no sensitivity list, so it always executes
begin
CLK = 1; 
#5; 
CLK = 0; 
#5;
end
// at start of test, load vectors and pulse reset
initial
begin
$readmemb("multicycle.tv", testvectors);
vectornum = 0; 
errors = 0;
reset = 1; 
#1; 
reset = 0;
end
// apply test vectors on rising edge of clk
always @(posedge CLK)
begin 
{RESET,RUN,Resultexpected,CurrentStateexpected} = testvectors[vectornum];
end
// check results on falling edge of clk
always @(negedge CLK)
if (~reset) begin // skip during reset
if (Result !== Resultexpected || CurrentState !== CurrentStateexpected) begin  
$display("Error: inputs = %b", {RESET,RUN});
$display(" outputs = %b (%b expected)",Result,CurrentState,Resultexpected,CurrentStateexpected); 
errors = errors + 1;
end 
// increment array index and read next testvector
vectornum = vectornum + 1;
if (testvectors[vectornum] === 14'bx) begin  
$display("%d tests completed with %d errors", 
vectornum, errors);
end
end
endmodule



