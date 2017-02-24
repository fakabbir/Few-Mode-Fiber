
c_light=3e8;

wave=[1510 1515 1520 1525 1530 1535 1540 1545 1550 1555 1560 1565 1570 1575 1580]*1e-9;

neff01=n0(:,1)';
neff02=n0(:,2)';
neff03=n1(:,3)';

neff11=n1(:,1)';
neff12=n1(:,2)';
neff13=n1(:,3)';

neff21=n2(:,1)';
neff22=n2(:,2)';
neff23=n2(:,3)';

wl_calc=1530e-9;
wl=1;


factor1=(neff02-neff01);
factor2=(gradient(neff02,wave)-gradient(neff01,wave));
DMD_02_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2)

factor1=(neff03-neff01);
factor2=(gradient(neff03,wave)-gradient(neff01,wave));
DMD_03_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2)

factor1=(neff11-neff01);
factor2=(gradient(neff11,wave)-gradient(neff01,wave));
DMD_11_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2)

factor1=(neff12-neff01);
factor2=(gradient(neff12,wave)-gradient(neff01,wave));
DMD_12_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2)

factor1=(neff13-neff01);
factor2=(gradient(neff13,wave)-gradient(neff01,wave));
DMD_13_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2)

%%%%%%%%5
factor1=(neff21-neff01);
factor2=(gradient(neff21,wave)-gradient(neff01,wave));
DMD_21_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2)

factor1=(neff22-neff01);
factor2=(gradient(neff22,wave)-gradient(neff01,wave));
DMD_22_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2)

factor1=(neff23-neff01);
factor2=(gradient(neff23,wave)-gradient(neff01,wave));
DMD_23_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2)
%%%%%%%%%%%%%%%%%%
figure()
plot(wave,DMD_02_01,'g',wave,DMD_03_01,'b')
title('Wavelength Vs DMD for Design 3')
xlabel('Wavelength(m)')
ylabel('DMD(ns/km)')
legend ('T02-T01','T03-T01')
grid on
%hold on
figure()

plot(wave,DMD_11_01,'g--',wave,DMD_12_01,'b--',wave,DMD_13_01,'r--')
title('Wavelength Vs DMD for Design 3')
xlabel('Wavelength(m)')
ylabel('DMD(ns/km)')
legend ('T11-T01','T12-T01','T13-T01')
grid on
%hold on
figure()

plot(wave,DMD_21_01,'g.',wave,DMD_22_01,'b.',wave,DMD_23_01,'r.')
title('Wavelength Vs DMD for Design 3')
xlabel('Wavelength(m)')
ylabel('DMD(ns/km)')
legend ('T21-T01','T22-T01','T23-T01')
grid on

