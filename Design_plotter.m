
d=0.7*10;
x_init=linspace(0,d,50);
x_final=linspace(62.5-30,62.5,50);
x_mid=linspace(d,62.5-30,50);
n_clad=1.4444;
delta_val=.80;
n_core=n_clad*sqrt((100)/(100-2*delta_val));


k1=1;
k2=2;
k3=3;
k4=5;
l_max=n_core-n_clad;
x_plot=linspace(-6,6,50);
figure
subplot(1,2,1)
n_mids=(l_max./(1+exp(-k1*(x_plot))))+n_clad;
n_mids2=(l_max./(1+exp(-k2*(x_plot))))+n_clad;
n_mids3=(l_max./(1+exp(-0.9*(x_plot))))+n_clad;
plot(linspace(0,7/2,50),ones(1,50)*n_core)
hold on
plot(ones(1,50)*7/2,linspace(n_core,n_clad,50));
plot(linspace(7/2,7,50),ones(1,50)*n_clad)
plot(x_mid,n_mids)
plot(x_final,ones(1,50)*n_clad)
plot(ones(1,50)*x_mid(end),linspace(n_core,n_clad,50))
xlabel('Radius in micrometer')
ylabel('Refractive index,N')
title('Design of fiber')
grid on

plot(x_mid,n_mids2)
plot(x_mid,n_mids2)
plot(x_mid,n_mids3)

d=0.7*10;
x_init=linspace(0,d,50);
x_final=linspace(62.5-30,62.5,50);
x_mid=linspace(d,62.5-30,50);
n_clad=1.4444;
delta_val=.80;
n_core=n_clad*sqrt((100)/(100-2*delta_val));


k1=1;
k2=2;
k3=3;
k4=5;
l_max=n_core-n_clad;
x_plot=linspace(-6,6,50);
subplot(1,2,2)
n_mids=(l_max./(1+exp(k1*(x_plot))))+n_clad;
n_mids2=(l_max./(1+exp(k2*(x_plot))))+n_clad;
n_mids3=(l_max./(1+exp(0.9*(x_plot))))+n_clad;
plot(x_mid,n_mids)
hold on
plot(linspace(0,7/2,50),ones(1,50)*n_core)
plot(ones(1,50)*7/2,linspace(n_core,n_clad,50))
plot(linspace(7/2,7,50),ones(1,50)*n_clad)
plot(ones(1,50)*7,linspace(n_core,n_clad,50))
plot(linspace(x_mid(end),62.5,50),ones(1,50)*n_clad)
xlabel('Radius in micrometer')
ylabel('Refractive index,N')
title('Design of fiber')
grid on


plot(x_mid,n_mids3)
