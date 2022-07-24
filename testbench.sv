// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module tb;
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "interface.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
  
logic hclk;
logic hresetn;

 always   #10 hclk = ~hclk;
  
initial 
  begin
   hresetn = 1;
  #2 hresetn = 0;
  end
  
  ahb_if inf(hclk, hresetn);
  amba_ahb_defines ahb(.hsel(inf.hsel), .haddr(inf.haddr), .htrans(inf.htrans), .hwrite(inf.hwrite), .hsize(inf.hsize), .hburst(inf.hburst), .hprot(inf.hprot), .hwdata(inf.hwdata), .hrdata(inf.hrdata), .hready(inf.hready), .hresp(inf.hresp));

  environment ev;
  
  initial
    begin
      ev = new(GEN, DRV, MON, SCB, mbx1, mbx2, intf);
      ev.GEN.rpt_cnt = 5;
      ev.main();
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
endmodule