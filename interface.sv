//Interface groups the design signals, specifies the direction (Modport) and Synchronize the signals(Clocking Block)

interface ahb_if (input logic hclk, hresetn);
////Initializing all the ports of DUT
logic hsel;
logic [31:0] haddr;
logic [1:0] htrans;
logic hwrite;
logic [2:0] hsize;
logic [2:0] hburst;
logic [3:0] hprot;
logic [31:0] hwdata;
logic [31:0] hrdata;
logic hready;
logic hresp;
  
endinterface