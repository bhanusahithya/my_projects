module Digital_Clock(Clk_1sec, reset,seconds,minutes,hours,k1,k2,excite,en,q1,q2,d1,d2,pre,clr);
input Clk_1sec,reset,k1,k2;
input pre,clr;
input en,excite;
output  reg q1,q2,d1,d2;
wire f,x1,x2,a1;
xor(x1,k1,1);
xnor(x2,k2,1);
and(a1,x2,1);
and(f,a1,x1);
//What are the Outputs? 
 output  reg[5:0] seconds;
 output reg[5:0] minutes;
 output reg[4:0] hours;
   
    always @(posedge(Clk_1sec) or posedge(reset)or f or en)
    begin
	seconds <= 0;
            minutes <= 0;
            hours <= 0; 
	if(en==1'b1)
	begin
		if((excite==1'b1) && (clr==1'b0))
			begin
			q1<=1'b1;
			q2<=1'b0;
			end
	end
	else if(en==1'b0)
	begin
		if((excite==1'b0) && (clr==1'b0))
			begin
			d1<=q2;
			q1<=d1;
			
			end
		else if((pre==1'b0)&&(excite==1'b0))
			begin
			d2<=q1;
			q2<=d2;
			end
	end
        if(reset == 1'b1)
	 begin  //check for active high reset.
            //reset the time.
            seconds <= 0;
            minutes <= 0;
            hours <= 0; 
	 end
	else if(f==1'b1)
		begin
        	if(Clk_1sec == 1'b1)
		begin   //at the beginning of each second
           	seconds <= seconds + 1; //increment sec
            	if(seconds == 60)  //check for max value of sec
		begin
                seconds <= 0;  //reset seconds
                minutes <= minutes + 1; //increment minutes
                if(minutes == 60)  //check for max value of min
		begin
                    minutes <= 0;  //reset minutes
                    hours <= hours + 1;  //increment hours
                   if(hours ==  24)   //check for max value of hours
                        hours <= 0; //reset hours
end
	end
end
end

         	else if(f==0'b1)
		begin
        	if(q1== 1'b1)
		begin   //at the beginning of each second
           	seconds <= seconds + 1; //increment sec
            	if(seconds == 60)  //check for max value of sec
		begin
                seconds <= 0;  //reset seconds
                minutes <= minutes + 1; //increment minutes
                if(minutes == 60)  //check for max value of min
		begin
                    minutes <= 0;  //reset minutes
                    hours <= hours + 1;  //increment hours
                   if(hours ==  24)   //check for max value of hours
                        hours <= 0; //reset hours
end
	end
end
end
end     
endmodule
