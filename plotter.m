
wave=[1510 1515 1520 1525 1530 1535 1540 1545 1550 1555 1560 1565 1570 1575 1580]*1e-9;
figure()
plot(wave,n0(:,1),'r',wave,n0(:,2),'b',wave,n0(:,3),'y')
xlabel('Wavelength(m)')
ylabel('N Effective')
title('N Effective vs Wavelength')
legend('LP01','LP02','LP03')

figure()
plot(wave,n1(:,1),'r',wave,n1(:,2),'b',wave,n1(:,3),'y')
xlabel('Wavelength(m)')
ylabel('N Effective')
title('N Effective vs Wavelength')
legend ('LP11','LP12','LP13')

figure()
plot(wave,n2(:,1),'r',wave,n2(:,2),'b',wave,n2(:,3),'y')
xlabel('Wavelength(m)')
ylabel('N Effective')
title('N Effective vs Wavelength')
legend ('LP21','LP22','LP23')



