% This file contains fiber and amplifier parameters

global stp;
format long;
 n_clad=1.4444;
 delta_val=.80;
 n_core=n_clad*sqrt((100)/(100-2*delta_val));
%  n0=[1.4445 1.4444+0.018 1.4442 1.4444];
%a=[2.1  7-2.1   0.5  60]*1e-6;
total_dia=62.5;
d=0.7*10;
global k_stepness ;
step_cal=(62.5-(30+d))/50;
%Using sigmid function
l_max=n_core-n_clad;
x_siz=linspace(-6,6,50);
n_mids=(l_max./(1+exp(-k_stepness*(x_siz))))+n_clad;
n0=[n_core n_mids n_clad];
a=[d ones(1,50)*step_cal 30]*1e-6;

% neffrs = 1.449407428027706 1.449407428027706 1.448007268677072 1.448007268677072 1.445850177852230 1.445850177852230 1.449924287761764

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
 mm=2;     % maximum number of roots


rho=10e24;  %Erbium ion concentration(per meter cube)
tsp=10e-3;


% L=30;%120;%88.35; %fiber length in m




