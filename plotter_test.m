
a=load('dmd_val1std0.txt');
a=a(1:length(a)-1);
b=load('dmd_val2std0.txt');
b=b(1:length(b)-2);
x1=[1:1:length(a)]*.5;
x2=[1:1:length(b)]*.5;
plot(x1,a,'--',x2,b,'--')