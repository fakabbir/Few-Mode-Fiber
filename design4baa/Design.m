format long;
n_clad=1.4444;
delta_val=.80;
half_delta_val=0.40;
n_corea=n_clad*sqrt((100)/(100-2*delta_val));
n_coreb=n_clad*sqrt((100)/(100-2*half_delta_val));

total_dia=62.5;
d=3;
%n0=[n_clad n_corea n_coreb n_corea n_clad];
%a=[d+k_stepness 10 10 10 32.5-d-k_stepness]*1e-6;
figure
subplot(3,1,1)
plot(linspace(0,d,50),ones(1,50)*n_clad);
hold on
plot(ones(1,50)*d,linspace(n_clad,n_corea,50));
plot(linspace(d,d+10,50),ones(1,50)*n_corea);
plot(ones(1,50)*(d+10),linspace(n_corea,n_coreb,50));
plot(linspace(d+10,d+20,50),ones(1,50)*n_coreb);
plot(ones(1,50)*d+20,linspace(n_coreb,n_corea,50));
plot(linspace(d+20,d+30,50),ones(1,50)*n_corea);
plot(ones(1,50)*(d+30),linspace(n_corea,n_clad,50));
plot(linspace(d+30,62.5,50),ones(1,50)*n_clad);
title('Fiber Design ABA')


subplot(3,1,2)
plot(linspace(0,d,50),ones(1,50)*n_clad);
hold on
plot(ones(1,50)*d,linspace(n_clad,n_corea,50));
plot(linspace(d,d+20,50),ones(1,50)*n_corea);
%plot(ones(1,50)*(d+10),linspace(n_corea,n_coreb,50));
%plot(linspace(d+10,d+20,50),ones(1,50)*n_coreb);
plot(ones(1,50)*d+20,linspace(n_corea,n_coreb,50));
plot(linspace(d+20,d+30,50),ones(1,50)*n_coreb);
plot(ones(1,50)*(d+30),linspace(n_coreb,n_clad,50));
plot(linspace(d+30,62.5,50),ones(1,50)*n_clad);
ylabel('Refractive Index N')

subplot(3,1,3)
plot(linspace(0,d,50),ones(1,50)*n_clad);
hold on
plot(ones(1,50)*d,linspace(n_clad,n_coreb,50));
plot(linspace(d,d+10,50),ones(1,50)*n_coreb);
plot(ones(1,50)*(d+10),linspace(n_coreb,n_corea,50));
plot(linspace(d+10,d+30,50),ones(1,50)*n_corea);
plot(ones(1,50)*d+30,linspace(n_coreb,n_corea,50));
%plot(linspace(d+20,d+30,50),ones(1,50)*n_corea);
plot(ones(1,50)*(d+30),linspace(n_corea,n_clad,50));
plot(linspace(d+30,62.5,50),ones(1,50)*n_clad);
xlabel('Radius in Micrometer')