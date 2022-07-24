class monitor;
  
  //virtual interface handle
  
  virtual ahb_if intf;
  transaction tr1;
  //create mailbox handle
  
  mailbox mbx2;

  //constructor
  
  function new(mailbox mbx2);
  this.mbx2 = mbx2;
    tr1 = new();
  endfunction

  //main method
  
  task main();
    repeat(10)
      begin
        @(posedge intf.hclk)
        tr1.hsel <= intf.hsel;
        tr1.haddr <= intf.haddr;
        tr1.hwrite <= intf.write;
        tr1.hwdata <= intf.hwdata;
        tr1.hrdata <= intf.hrdata;
        tr1.hready <= intf.hready;
        tr1.hresp <= intf.hresp;
        tr1.hprot <= intf.hprot;
        tr1.htrans <= intf.htrans;
        tr1.hsize <= intf.hsize;
        
        mbx2.put(tr1);
        tr1.display("Monitor");
      end
        endtask

endclass
