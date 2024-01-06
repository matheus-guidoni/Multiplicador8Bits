module uc (zero, 
			  init, 
			  loadbrREG, 
			  loadarREG, 
			  loadprREG, 
			  selREG, 
			  doneREG, 
			  clk);

	input zero, init, clk;
	output loadarREG, loadbrREG, loadprREG, selREG, doneREG;
	
	
	reg loadar, loadbr, loadpr, sel, done;
	reg [1:0] state;
	
	parameter IDLE = 2'b00,
				 MUL = 2'b01,
				 FIM = 2'b10;
	
	initial begin
	
		done = 1'b0;
		loadar = 1'b0;
		loadbr = 1'b0;
		loadpr = 1'b0;
		sel = 1'b0;
		state <= IDLE;
	
	end
	
	
	always @(posedge clk) begin
		case (state)
			IDLE: begin
				if (init == 1'b1) begin
					sel = 1'b0;
					loadar = 1'b1;
					loadbr = 1'b1;
					state = MUL;
				end
			
				else state = IDLE;
			end
			MUL: begin
				sel = 1'b1;
				loadar = 1'b1;
				loadbr = 1'b1;
				loadpr = 1'b1;
				if (zero == 1'b0)
					state = FIM;
				else state = MUL;
			
			end
			
			FIM: 
				done = 1'b1;	
		endcase
	end

	assign loadarREG = loadar,
			 loadbrREG = loadbr,
			 loadprREG = loadpr,
			 selREG = sel,
			 doneREG = done;
			 

endmodule