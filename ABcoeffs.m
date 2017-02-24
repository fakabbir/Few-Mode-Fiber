% This function calculates the coefficients in the various layers for a given neff.
% Called in the main program "field"

function AB=ABcoeffs(neff,wl,l);

%neff=1.45082856971191
fvalues;  % contains the values of variables required in this function
m=l;

for ia=1:1:length(a)
    aa(ia)=sum(a(1:ia));
end

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

beta=neff*k;

A1B1=[1;0];
AB(1,:)=A1B1;
S=[1 0;0 1];

usqr2=k^2*(n(1)^2-neff^2);
u2=sqrt(abs(usqr2));

for i=2:1:length(n)
    
    usqr1=k^2*(n(i)^2-neff^2);
    u1=sqrt(abs(usqr1));
    a1=u1*aa(i-1);
    a2=u2*aa(i-1);
    
    if usqr1>=0,
        p11=besselj(m,a1);
        p12=bessely(m,a1);
        jp= 0.5*(besselj(m-1,a1)-besselj(m+1,a1));
        yp=0.5*(bessely(m-1,a1)-bessely(m+1,a1));
        p21=u1*jp/beta;
        p22=u1*yp/beta;
    else
        p11=besseli(m,a1);
        p12=besselk(m,a1);
        ip=0.5*(besseli(m-1,a1)+besseli(m+1,a1));
        kp=-0.5*(besselk(m-1,a1)+besselk(m+1,a1));
        p21=u1*ip/beta;
        p22=u1*kp/beta;
    end;
    
    if usqr2>=0
        q11=besselj(m,a2);
        q12=bessely(m,a2);
        jp= 0.5*(besselj(m-1,a2)-besselj(m+1,a2));
        yp=0.5*(bessely(m-1,a2)-bessely(m+1,a2));
        q21=u2*jp/beta;
        q22=u2*yp/beta;
    else
        q11=besseli(m,a2);
        q12=besselk(m,a2);
        ip=0.5*(besseli(m-1,a2)+besseli(m+1,a2));
        kp=-0.5*(besselk(m-1,a2)+besselk(m+1,a2));
        q21=u2*ip/beta;
        q22=u2*kp/beta;
    end
    
    usqr2=usqr1;
    u2=u1;
    P=[p11 p12;p21 p22];
    Q=[q11 q12;q21 q22];
    RR=inv(P);
    S0=RR*Q;
    SS=S0*S;
    S=SS;
    AB(i,:)=S0*AB(i-1,:)';
end;

