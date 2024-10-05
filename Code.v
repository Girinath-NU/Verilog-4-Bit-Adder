module adder(a,b,ci,s,co);
input [3:0]a,b;
input ci;
output co;
output [3:0]s;
wire w1,w2,w3,w4;
fa f1(a[0],b[0],ci,s[0],w1);
fa f2(a[1],b[1],w1,s[1],w2);
fa f3(a[2],b[2],w2,s[2],w3);
fa f4(a[3],b[3],w3,s[3],w4);
endmodule
