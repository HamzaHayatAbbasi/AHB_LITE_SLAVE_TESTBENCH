class transaction;

  
  //declare transaction items
  
rand logic hsel;
rand logic [31:0] haddr;
rand logic [1:0] htrans;
bit hwrite;
rand logic [2:0] hsize;
rand logic [2:0] hburst;
rand logic [3:0] hprot;
rand logic [31:0] hwdata;
logic [31:0] hrdata;
logic hready;
logic hresp; 
  
  //Add Constraints

  constraint a1{htrans == 2;}
  constraint a2{hsize inside {2};}
  constraint a3{if(hsize==1)haddr%2==0;else if(hsize==2)haddr%4==0; else haddr%1==0;}
    constraint a4{haddr<=1023;}
    constraint a5{hwdata<=255;}
    constraint a6{hprot == 4'b0001;}
    constraint a7{hburst == 0;}
  
  //Add print transaction method(optional)
   
    function new(logic hsel,logic [31:0] haddr,logic [1:0] htrans, bit hwrite, logic [2:0] hsize,logic [2:0] hburst,logic [3:0] hprot, logic [31:0] hwdata, logic [31:0] hrdata, logic hready,   logic hresp);
this.hsel = hsel;
this.haddr = haddr;
this.htrans = htrans;
this.hwrite = hwrite;
this.hsize = hsize;
this.hburst = hburst;                
this.hprot = hprot;                
this.hwdata = hwdata;
this.hrdata = hrdata;
this.hready = hready;
this.hresp = hresp;
endfunction 
                
                function display(input string a);
                  
                  $display("Hsel = %0d", hsel);
                  $display("Haddr = %0d", haddr);
                  $display("Htrans = %0d", htrans);
                  $display("Hwrite = %0d", hwrite);
                  $display("Hsize = %0d", hsize);
                  $display("Hburst = %0d", hburst);
                  $display("Hprot = %0d", hprot);
                  $display("Hwdata = %0d", hwdata);
                  $display("Hrdata = %0d", hrdata);
                  $display("Hready = %0d", hready);
                  
                endfunction
                  
    
endclass