class generator;
  
  int rpt_cnt = 0;
  
  //declare transaction class
  
  transaction tr1, tr2;
    
  //create mailbox handle
  
  mailbox mbx1;     		//mbx1 = gen2drv,  mbx2 = gen2scb
  
  //declare an event
  
  event e1, e2;
  
  //constructor
  
  function new(mailbox mbx1);
this.mbx1 = mbx1;
tr1 = new();
tr2 = new tr1;
endfunction
  
  //main methods
  
  task main();
    repeat(rpt_cnt)
      begin
        assert(tr1.randomize);
        tr1.hwrite = 1'b1;
        mbx1.put(tr1);
        assert(tr2.randomize);
        tr1.hwrite = 1'b0;
        @(e1);
      end
	->e2;
  endtask
  
endclass