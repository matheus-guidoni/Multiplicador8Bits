module multiplicador(multiplicand, 
							multiplier,
						   loadbr, 
							loadpr, 
							loadar, 
							sel,
							clk, 
							done, 
							zero_notreg,
							produto_notreg);

	input loadbr, loadpr, loadar, clk, sel, done;
	input [7:0] multiplicand, multiplier;
	output zero_notreg;
	output [15:0] produto_notreg;
	
	
	reg [15:0] sum, pr, produto;
	reg [7:0] reg1, reg2, reg3, br, y, ar, count;
	reg zero;
	
	initial begin
	
		reg1 = 8'd0;
		reg2 = 8'd0;
		reg3 = 8'd0;
		zero = 1'b1;
		produto = 16'd0;
		count = multiplier;
		
	end

	
	
	always @(posedge clk) begin
		if (done == 0) begin
			if (loadbr == 1'b1)
				reg1 = multiplicand;
			
			br = reg1;
			
			sum = reg3 + br;
			
			if (loadpr == 1'b1)
				reg3 = sum;
			pr = reg3;
			produto = pr;
		end
	end
	
	
	always @(posedge clk) begin
		if (done == 0) begin
			if (sel == 1'b0) begin	
				y = multiplier;
				
				if (loadar == 1'b1) 
					reg2 = y;
				
				ar = reg2;
				
				if (count == 1'b0)
					zero = 0;
			end
		
			
			else begin /* Se sel == 1 */
				
				y = count;
				
				if (loadar == 1'b1)
					reg2 = y;
				
				ar = reg2;
		
				count = ar - 1'b1;
				
				if (count == 1'b0)
					zero = 1'b0;
			
			end
		end
	end

	assign zero_notreg = zero;
	assign produto_notreg = produto;
		
endmodule