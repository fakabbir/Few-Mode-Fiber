% This file contains fiber and amplifier parameters

global stp;
global k_stepness ;
format long;
n_clad=1.4444;
delta_val=.363;
%half_delta_val=0.40;
n_core=n_clad*sqrt((100)/(100-2*delta_val));
%n_coreb=n_clad*sqrt((100)/(100-2*half_delta_val));

total_dia=62.5;
%d=0.3*10;
%n_points=linspace(-100,100,30);
%n_exp=gauss_distribution(n_points,0,k_stepness);
%t=ones(1,30)*n_clad;
%n_exp=n_exp+t;
a_val=62.5-25.5;
r_val=linspace(0,a_val,40);
n_cores=n_core*sqrt(1-(2*delta_val*0.01*(r_val/a_val).^2.29));
n0=[n_cores n_clad];
a=[ ones(1,40)*1 25.5 ]*1e-6;

a1=0;
%2e-6; r_min for doped region
a2=a(1);
% r_max for doped region

for ia=1:1:length(a)
        aa(ia)=sum(a(1:ia));
end

stp=abs((aa(length(aa))-a1)/170);

chklky=0; % 0 to supress leaky mode calculations
%l=1;      % l of LP(l,m) mode
mm=3;     % maximum number of roots

rho=10e24;  %Erbium ion concentration(per meter cube)
tsp=10e-3;

% L=30;%120;%88.35; %fiber length in m