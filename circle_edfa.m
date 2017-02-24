function circle_edfa()
fvalues;
r=aa;
theta=linspace(0,2*pi,100);
hold on
for i=1:length(r)
    x=r(i)*cos(theta);
    y=r(i)*sin(theta);
    if i==4
        plot(x,y,'w','Linewidth',2)
    else
        plot(x,y,'--k','Linewidth',3)
    end
    
end
