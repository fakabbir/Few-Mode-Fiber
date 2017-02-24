function [neffr]=modesolv_l(wl,l,check1,check2);
% This program finds out the LP(l,m)leaky/guided modes for a given ri profile, 
% as defined in "fvalues".
% The program plots the field pattern for a given beta.
% IEEE trans.microwave theory and techniques, vol MTT-29, no. 4, Apr. 1981, p.342p
% Appl Opt vol. 30, no. 27, Sept. 1991, p.3877

%clear all;
%clc;
format long;

warning off, 'Matrix is singular to working precision.';
warning off, 'Matrix is close to singular or badly scaled.';
warning off, 'Polynomial is badly conditioned. Remove repeated data points';
close all
fvalues;%should include n(i),r(i), number of layers, wavelength, and l

%wl=1600e-9;%1490e-9;%980e-9;
%showpl=1;
%flindx=1;
showpl=1;
plindx=0;
k=(2*pi)/wl;

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
   
%V=k*a(1)*sqrt(n(1)^2-n(2)^2)    
%n1=n1+del;
%n2=n2+del;
%n3=n3+del;
%n=[n1 n2 n3];    


neffr=[];

nmax=max(n)-1e-8;          % the higher ri value within which beta is to be found
nmin=min(n)+1e-8;         % the lower ri value



if chklky==1            % calculations for leaky modes
    nincr=2e-7;
    nn=1;
    fb1max(nn)=0.0;
    i=1;
    fbb(i)=findP(nmax,wl);
 
     % figure;
     % hold on;
    
    if (nn<=mm) 

        for eff=nmax:-nincr:nmin,
            i=i+1;
            eff1=eff-nincr;
        
            fb1=findP(eff1,wl);
            fbb(i)=fb1;
        
      %     plot(eff1,fb1,'*')
      %     drawnow;
    
    
            if(fb1>fb1max(nn))
                fb1max(nn)=fb1;
                effmax(nn)=eff1;
            end
        
            if(fbb(i)>fbb(i-1)) %to ensure searching peak on ascend
                if(fb1<fb1max(nn))
                    root(nn)=effmax(nn);
                    %[nn root(nn)]
                    if nn<mm
                        nn=nn+1;
                    else
                        break
                    end
                    %nn=nn+1;
                    fb1max(nn)=0;
                end
            end
        end
    end

       
    %hold off
    for in=1:1:length(effmax);
        effm=effmax(in)+10*nincr:-nincr/50:effmax(in)-10*nincr;
        for ie=1:1:length(effm),
            fbm(ie)=findP(effm(ie),wl,l,m);
        end
        
        
        [fbmmax,ifmax]=max(fbm);
        fbmnorm=fbm/fbmmax;
        efmax=effm(ifmax);
                                
        invfb=1./fbm;
        %figure;
        %plot(effm,invfb)
        pp=polyfit(effm,invfb,2);
        pval=polyval(pp,effm);
        %hold on
        %plot(effm,pval,'r-')
        %hold off 
        [pmin,im]=min(pval);
        neffr(in)=effm(im);
        xmax=-pp(2)/(2*pp(1));
        fac=1/pp(1);
        w=sqrt(fac*min(invfb));
        neffi(in)=w;
        
        alp(in)=2*k*neffi(in);
        loss(in)=20*0.4343*neffi(in)*k;
        %disp(['nn= ',num2str(in),', loss (dB/m)',',  ',num2str(loss(in)),', neff= ',num2str(neffr(in),'%9.8f')])
    end
else
    
    nincr=5e-6;                             % calculations for guided modes
    nn=1;
    fb=findP(nmax,wl,l);
    %figure;
    %hold on;
    
    
    for eff=nmax:-nincr:nmin
        eff1=eff-nincr;
        fb1=findP(eff1,wl,l);
     %   plot(eff1,fb1,'*');
     %   drawnow;
        if fb*fb1<=0
            accn=1e-12*(eff+eff1)/2;
            root(nn)=bisec(eff,eff1,accn,wl,l);
            neffr(nn)=root(nn);
            if nn<mm
              nn=nn+1;
            else
                break
            end
        end
        if nn==mm+1
            break
        end
        fb=fb1;
    end
        %if nn==1
        %    disp('No roots found')
        %    neffr=[];
        %end
end
%hold off

maxn=min([mm,length(neffr)])
if chklky==1
    loss=loss(1:maxn);
    alp=alp;
else
    loss=zeros(1,maxn);
    alp=zeros(1,maxn);
end

if length(neffr)~=0
    %inmd=0
    
    for ia=1:1:length(a)
        aa(ia)=sum(a(1:ia));
    end
%     in=m;
    for in=1:maxn;%min([mm,length(neffr)]);%length(neffr);  %Mode field calculations
    %inmd=inmd+1
    r0=1e-20;
    rmax=aa(length(aa))+2e-6;
    nstp=fix((rmax-r0)/stp);
    j=1;
    m=l;

    coeffs=ABcoeffs(neffr(in),wl,l);

   
    for j=1:1:nstp+1
        r(j)=r0+(j-1)*stp;
        
        
        for ij=1:length(aa)-1
            if r(j)<=aa(ij)
                j1=ij;
                break
            end
        end
        
        if r(j)>aa(length(aa)-1)
            j1=length(aa);
        end
        
        u2(j)=(k*n(j1))^2-(k*neffr(in))^2;
        ri(j)=n(j1);
       
        if u2(j)>=0,
            u(j)=sqrt(u2(j))*r(j);
            f(j)=(coeffs(j1,1)*besselj(m,u(j)))+(coeffs(j1,2)*bessely(m,u(j)));
        else
            u(j)=sqrt(-u2(j))*r(j);
            f(j)=(coeffs(j1,1)*besseli(m,u(j)))+(coeffs(j1,2)*besselk(m,u(j)));
        end;
    end;
    ir=aa(length(aa)-1)/stp;

flmax=max(abs(f(1:ir))); %finds the maximum value of field in the core
    fone=f/flmax;

     imm=length(f);

     nj1=1+ceil((a1-r0)/stp);
    nj2=1+ceil(((aa(length(aa)-1)+10e-6)-r0)/stp);
rrr=r(nj1:nj2);fff=fone(nj1:nj2);
     
    pintgrd=(fff.^2).*rrr;
    area=trapz(rrr,pintgrd);
    if l==0
    cc=1./(2*pi*area);
    else
       cc=1./(pi*area); 
    end

    field_norm=sqrt(cc)*fone;

    rr=r(nj1:nj2);
    fpnorm=field_norm(nj1:nj2);
   
  nr=length(rr);
theta=linspace(0,2*pi,nr);
z=meshgrid(fpnorm);

    [x,y]=meshgrid(rr,theta);
   
if l==0
    
    for i=1:nr,
      for j=1:nr,
        x(i,j)=rr(j).*cos(theta(i));
        y1(i,j)=rr(j).*sin(theta(i));
      end
    end
         field=z;
         z2=field;
         z3=field.^2;
         

      if (check1==0)&&(check2==0)
          
       intensity=z3
         figure
      contour(x,y1,z3,1000)
     title(['Normalised intensity','LP(',num2str(l),',',num2str(in),') mode',', neff=',num2str(neffr(in)),' \lambda =',num2str(wl)])
      end
      
    else
        
for i=1:nr,
    for j=1:nr,
        x(i,j)=rr(j).*cos(theta(i));
        y1(i,j)=rr(j).*sin(theta(i));

    end
end
   
field=z.*cos(l.*y);
   z2e=field;
   z3e=field.^2; 
field=z.*sin(l.*y);
   z2o=field;
   z3o=field.^2;
inten=(z3e+z3o); 
   z3oe=inten/2;
   z2oe=sqrt(z3oe);
   
if (check1==0)&&(check2==1)
    intensity=z3e;
     figure
 contour(x,y1,z3e,1000)
  title(['Normalised intensity even','LP(',num2str(l),',',num2str(in),') mode',', neff=',num2str(neffr(in)),' \lambda =',num2str(wl)])

elseif (check1==1)&&(check2==0)
        intensity=z3o;

   figure
 contour(x,y1,z3o,1000)

  title(['Normalised Intensity odd','LP(',num2str(l),',',num2str(in),') mode',', neff=',num2str(neffr(in)),' \lambda =',num2str(wl)])

elseif (check1==1)&&(check2==1)
    intensity=z3oe;

  figure
 contour(x,y1,z3oe,1000)
  title(['Normalised Intensity even + odd','LP(',num2str(l),',',num2str(in),') mode',', neff=',num2str(neffr(in)),' \lambda =',num2str(wl)])

end
end

%hold on
%circle_edfa()
    end
  
end 
