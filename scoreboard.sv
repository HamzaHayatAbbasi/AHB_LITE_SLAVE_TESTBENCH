class scoreboard;
   
  //create mailbox handle
  
  logic [31:0] addr;
  
  mailbox mbx2;
  transaction tr1;

  //array to use as local memory

  logic [31:0] mem [0:255];
  
  //constructor
  
  function new(mailbox mbx2);
  this.mbx2 = mbx2;
  tr1 = new();
  endfunction
  
  //main method
  
  task main();
    repeat (10)
      begin
        mbx2.get(tr1);
        tr1.display("Scoreboard");
        if(tr1.hwrite == 1)
          begin
        mem[addr] <= tr1.hwdata;
            $display("Data is being stored in memory %0d", tr1.hwdata);
          end
        else if (tr1.hwdata == tr1.hrdata) begin
              $display("Data is being matched");
        end
            else begin
              $display("Data is unmatched");
          end
      
    ->e1;
    end
  endtask
 
endclass