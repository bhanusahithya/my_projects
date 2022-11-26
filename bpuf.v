module bpuf(excite,en,q1,q2,d1,d2,pre,clr);
input pre,clr;
input en,excite;
output  reg q1,q2,d1,d2;
always@(en)
begin
if(en==1'b1)
	begin
		if((excite==1'b1) && (clr==1'b0))
			begin
			q1<=1'b1;
			q2<=1'b0;
			end
		else if((pre==1'b0) && (excite==1'b1))
			begin
			q2<=1'b0;
			q1<=1'b0;
			end
	end
else if(en==1'b0)
	begin
		if((excite==1'b0) && (clr==1'b0))
			begin
			d2<=q1;
			q2<=d2;
			end
		else if((pre==1'b0)&&(excite==1'b0))
			begin
			d1<=q2;
			q1<=d1;
			end
	end
end
endmodule
