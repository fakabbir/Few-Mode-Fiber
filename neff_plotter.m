a1=load('a1.txt');
a2=load('a2.txt');
a3=load('a3.txt');
a4=load('a4.txt');
a4=a4(1:length(a4)-1);
a5=load('a5.txt');

x1=[1:1:length(a1)];
x2=[1:1:length(a2)];
x3=[1:1:length(a3)];
x4=[1:1:length(a4)];
x5=[1:1:length(a5)];

plot(x1,a1,x3,a3,x4,a4)