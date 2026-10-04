/* 
To avoid creating latches, all outputs must be assigned a value in all possible conditions.
Simply having a default case is not enough. 
Assign a "default value" to the outputs before the case statement
This also means that a default: case item becomes unnecessary. 
*/

module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    
    always @ (*) 
        begin
        left =1'b0; down =1'b0; right =1'b0; up =1'b0;
            case (scancode)
               16'he06b : left = 1'b1;
               16'he072 : down = 1'b1;
               16'he074 : right= 1'b1;	
               16'he075 : up   = 1'b1;	 
           endcase
        end

endmodule
