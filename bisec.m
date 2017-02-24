function rtbis=bisec(nmin,nmax,xacc,wl,l);
fvalues;%should include n(i),r(i), number of layers, wavelength, and l

fmid=findP(nmax,wl,l);
f0=findP(nmin,wl,l);
jmax=500; %maximum number of bisections

if f0*fmid>=0 
    disp('Roots must be bracketed for bisection');
end

if f0<0
    rtbis=nmin;
    dx=nmax-nmin;
else
    rtbis=nmax;
    dx=nmin-nmax;
end


for j=1:jmax,
    dx=dx/2;
    xmid=rtbis+dx;
    fmid=findP(xmid,wl,l);
    
    if  fmid<0
        rtbis=xmid;
    end
    
    if (abs(dx)<xacc)|fmid==0
        break
    end
    %disp('too many bisections');
end
