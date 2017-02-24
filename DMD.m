% This file is a demo file to give a propere understanding of how to calculate DMD for a given fiber.
% Here it is assumed that the refractive index for various wavelength is as given in the lines below.
% The code that is in coherance with the project is mentioned in DMGD.
clear all
clc
c_light=3e8;

neff01=[   1.455647207869456   1.455580094917766   1.455512869159531   1.455445529406786   1.455378074489678   1.455310503251355  1.455242814553594];
neff02=[   1.449805481118129   1.449711325548641   1.449617112582277  1.449522842982530   1.449428517560805   1.449334137178462  1.449239702746485];
neff11=[  1.453443783743546   1.453365118738167   1.453286330379795  1.453207417654514   1.453128379565323   1.453049215131801   1.452969923388575];
   
neff21=[ 1.450641373745368   1.450549156603567   1.450456827042651 1.450364384628057   1.450271828950490   1.450179159620803 1.450086376273249];
neff31=[   1.447418332976268   1.447314912911407   1.447211584336113   1.447108362612247   1.447005266554202   1.446902320453923 1.446799559541558];
 
wav=[1530 1535 1540 1545 1550 1555 1560]*1e-9;
wl_calc=1530e-9;
wl=1;
factor1=(neff11-neff01);
factor2=(gradient(neff11,wav)-gradient(neff01,wav));
DMD_11_01=1e+12.*((1/c_light).*factor1-(wav./c_light).*factor2)

factor1=(neff02-neff01);
factor2=(gradient(neff02,wav)-gradient(neff01,wav));
DMD_02_01=1e+12.*((1/c_light).*factor1-(wav./c_light).*factor2)

factor1=(neff21-neff01);
factor2=(gradient(neff21,wav)-gradient(neff01,wav));
DMD_21_01=1e+12.*((1/c_light).*factor1-(wav./c_light).*factor2)

plot(wav,DMD_11_01,'r--')
hold on
plot(wav,DMD_02_01,'b*')
hold on
plot(wav,DMD_21_01,'g-.')

% DMD_11_01 =[4.4383    4.4437    4.4545    4.4650    4.4755    4.4858    4.4909];
% 
% DMD_02_01 = [8.1110    8.0827    8.0249    7.9649    7.9026    7.8381  7.8052];
% 
% DMD_21_01 = [8.9202    8.9200    8.9192    8.9176    8.9153    8.9121  8.9103];


