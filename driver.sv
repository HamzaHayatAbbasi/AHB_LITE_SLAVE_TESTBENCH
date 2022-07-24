class driver;
  //virtual interface handle
  
  virtual ahb_if intf;
  transaction tr1;

  //create mailbox handle
  
  mailbox mbx1;

  //constructor
  
  function new(mailbox mbx1);
  this.mbx1 = mbx1;
    tr1 = new();
  endfunction
  
  //reset methods
  
  task reset_sequence();
    wait (!intf.hresetn);
    intf.hsel <= 0;
    intf.haddr <= 0;
    intf.htrans <= 0;
    intf.hwrite <= 0;
    intf.hsize <= 0;
    intf.hburst <= 0;
    intf.hprot <= 0;
    intf.hwdata <= 0;
    wait (intf.hresetn);
  endtask
  //drive methods

  task drive_signal();
    repeat (10)
      begin
        mbx1.get(tr1);
        tr1.display("Driver");
        
        intf.hsel <= tr1.hsel;
        intf.haddr <= tr1.haddr;
        intf.htrans <= tr1.htrans;
        intf.hwrite <= tr1.hsize;
        intf.hburst <= tr1.hburst;
        intf.hprot <= tr1.hprot;
        intf.hwdata <= tr1.hwdata;
      end
    ->e1;
        endtask
  //main methods
        
        task main();
          wait (reset_sequence);
          drive_signals();
        endtask
endclass