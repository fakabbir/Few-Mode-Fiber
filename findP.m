function Pvalue=findP(neff,wl,l);

% This function finds out the value of P(1,1) for a given value of beta ie. neff.
% Called in the main program "diggavi_bisect"

fvalues; %should include n(i),r(i), number of layers, wavelength, and l
m=l;
P=[1 0;0 1];
k=2*pi/wl;
l0=wl*1e6;
    c0=1.4508554;
    c1=-0.0031268;
    c2=-0.0000381;
    c3=0.003027;
    c4=-0.0000779;
    c5=0.0000018;
    x=0.035;
    ns=c0 + c1*l0^2 + c2*l0^4 + c3/(l0^2-x) + c4/(l0^2-x)^2 + c5/(l0^2-x)^3;
    
    del=ns-1.444388;
    
    for i=1:length(n0)
        n(i)=n0(i)+del;
    end

for ia=1:1:length(a)
    aa(ia)=sum(a(1:ia));
end


    beta=neff*k;

for i1=length(n-1):-1:2,
    
    usq(i1)=(k*n(i1))^2-beta^2;
    usq(i1-1)=(k*n(i1-1))^2-beta^2;
    
    if usq(i1)>0,
        ua1=sqrt(usq(i1))*aa(i1-1);
        a1=besselj(m,ua1); 
        b1=bessely(m,ua1); 
        jp_c1= 0.5*(besselj(m-1,ua1)-besselj(m+1,ua1));%-besselj(1,ua1);               
	% jp_c1 is the derivative of bessel J reqd. for c1
        c1=sqrt(usq(i1))*jp_c1/beta; 
        yp_d1=0.5*(bessely(m-1,ua1)-bessely(m+1,ua1));%-bessely(1,ua1); 
        d1=sqrt(usq(i1))*yp_d1/beta;         
	% yp_d1 is the derivative of bessel Y reqd. for c1
    end;

    
    if usq(i1-1)>0,
        ua2=sqrt(usq(i1-1))*aa(i1-1);
        a2=besselj(m,ua2);
        b2=bessely(m,ua2);
        jp_c2=0.5*(besselj(m-1,ua2)-besselj(m+1,ua2));%-besselj(1,ua2); 
        c2=sqrt(usq(i1-1))*jp_c2/beta;        
	% jp_c2 is the derivative reqd. for c2
        yp_d2=0.5*(bessely(m-1,ua2)-bessely(m+1,ua2));%-bessely(1,ua2); 
        d2=sqrt(usq(i1-1))*yp_d2/beta; 
    end;
    
    if usq(i1)<0,
        ua1=sqrt(-usq(i1))*aa(i1-1);
        a1=besseli(m,ua1);
        b1=besselk(m,ua1);
        ip_c1=0.5*(besseli(m-1,ua1)+besseli(m+1,ua1));%besseli(1,ua1);                  
	% ip_d1 is the derivative of bessel I reqd. for c1
        c1=sqrt(-usq(i1))*ip_c1/beta;
        ip_d1=-0.5*(besselk(m-1,ua1)+besselk(m+1,ua1));%-besselk(1,ua1); 
        d1=sqrt(-usq(i1))*ip_d1/beta;
    end;
    
    if usq(i1-1)<0,
        ua2=sqrt(-usq(i1-1))*aa(i1-1);
        a2=besseli(m,ua2);
        b2=besselk(m,ua2);
        ip_c2=0.5*(besseli(m-1,ua2)+besseli(m+1,ua2));%besseli(1,ua2);
        c2=sqrt(-usq(i1-1))*ip_c2/beta;
        ip_d2=-0.5*(besselk(m-1,ua2)+besselk(m+1,ua2));%-besselk(1,ua2);
        d2=sqrt(-usq(i1-1))*ip_d2/beta;
    end;
    
    p1=[a1 b1; c1 d1];              % p1 is the first matrix in P
    p2=[a2 b2; c2 d2];              % invp is the inverse of p
    invp1=inv(p1);                  % p2 is the 2nd matrix of P
    Pi=invp1*p2;
    P=P*Pi;
end;

if chklky==1
    Pvalue=1/(P(1,1)^2+P(2,1)^2); %for leaky modes
else
    Pvalue=P(1,1); %for guided mode
end
