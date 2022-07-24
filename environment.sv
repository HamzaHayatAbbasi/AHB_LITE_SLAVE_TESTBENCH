
class environment;
  
  //handles of all components
  
  generator GEN;
  driver DRV;
  monitor MON;
  scoreboard SCB;
  
  //mailbox handles
  
  mailbox mbx1, mbx2;
  
  //declare an event
  
  event e3;
  
  //virtual interface handle
  
  virtual ahb_if intf;
  
  
  //constructor
  
  function new(generator GEN, driver DRV, monitor MON, scoreboard SCB, mailbox mbx1, mailbox mbx2, virtual ahb_if intf);
    mbx1 = new();
    mbx2 = new();
    GEN = new(mbx1);
    DRV = new(mbx1);
    MON = new(mbx2);
    SCB = new(mbx2);
    this.intf = intf;
    DRV.intf = this.intf;
    MON.intf = this.intf;
    GEN.e1 = e2;
    SCB.e1 = e2;
  endfunction
  
  //pre_test methods
  
  task pre_test();
  DRV.reset_sequence();
  endtask
  
  //test methods
  
  task method();
    fork
      GEN.main();
      DRV.main();
      MON.main();
      SCB.main();
    join_any
  endtask
  
  //post_test methods
    
  task post_test();
    wait (GEN.e1.triggered);
    $finish;
    
  //run methods
    
    task run_method();
      pre_test();
      method();
      post_test();
    endtask
  
endclass