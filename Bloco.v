

module MultiplicadorBinario (multiplicand, 
									  multiplier,
									  clk, 
									  init, 
									  produto);
			
	input [7:0] multiplicand, multiplier;
	input clk, init;
	output [15:0] produto;

	wire w_loadar;
	wire w_loadbr;
	wire w_loadpr;
	wire w_sel;
	wire w_done;
	wire w_zero;
		  
		  
	
	multiplicador MUL (.multiplicand(multiplicand), 
							 .multiplier(multiplier), 
							 .loadbr(w_loadbr), 
							 .loadpr(w_loadpr), 
							 .loadar(w_loadar), 
							 .sel(w_sel), 
							 .clk(clk), 
							 .zero_notreg(w_zero), 
							 .done(w_done), 
							 .produto_notreg(produto));
							
	uc unitcontrol (.zero(w_zero), 
						 .init(init), 
						 .loadbrREG(w_loadbr), 
						 .loadarREG(w_loadbr), 
						 .loadprREG(w_loadpr), 
						 .selREG(w_sel), 
						 .doneREG(w_done), 
						 .clk(clk));

endmodule

