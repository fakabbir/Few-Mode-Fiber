clear all;
dir_path = 'design4aba';
mkdir(dir_path);
global k_stepness ;
copyfile('fvalues.m','design4aba/fvalues.m')
copyfile('Design_plotter.m','design4aba/Design.m')
copyfile('Design_plotter.ipynb','design4aba/Des_plot.ipynb')
wave=[1528.5 1529.0 1529.5 1530 1530.5 1531.0 1531.5]*1e-9+20e-9;
%wave=1550e-9; 
for j_profile=3:0.2:9,
    k_stepness=j_profile;
for i=1:length(wave),
    [neffr]=modesolv_l(wave(i),0,0,0);
    nil=5-length(neffr);
    bzero=zeros(1,nil);
    n0(i,:)=[neffr bzero];
end
for i=1:length(wave),
    [neffr]=modesolv_l(wave(i),1,0,1);
    nil=5-length(neffr);
    bzero=zeros(1,nil);
    n1(i,:)=[neffr bzero];
end
for i=1:length(wave),
    [neffr]=modesolv_l(wave(i),2,0,1);
    nil=5-length(neffr);
    bzero=zeros(1,nil);
    n2(i,:)=[neffr bzero];
end

%----------------------
neff01=n0(:,1)';
neff11=n1(:,1)';
neff21=n2(:,1)';
c_light=3e8;
%----------------------
factor1=(neff11-neff01);
factor2=(gradient(neff11,wave)-gradient(neff01,wave));
DMD_11_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2);

factor1=(neff21-neff01);
factor2=(gradient(neff21,wave)-gradient(neff01,wave));
DMD_21_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2);
%----------------------
dmd1=sum(DMD_11_01)/length(DMD_11_01);
dmd2=sum(DMD_21_01)/length(DMD_21_01);
%----------------------
%DMD Calculation
%----------------------
% For DMD11
file_dmd = 'dmd11.txt';
out = fullfile(dir_path,file_dmd);
fileID_dmd = fopen(out,'a');
fprintf(fileID_dmd,'%.6g ',dmd1);
% For DMD21
file_dmd = 'dmd21.txt';
out = fullfile(dir_path,file_dmd);
fileID_dmd = fopen(out,'a');
fprintf(fileID_dmd,'%.6g ',dmd2);
%----------------------

%----------------------
%for neffective
%----------------------
file_01 = 'neff_01.txt';
out_01 = fullfile(dir_path,file_01);
fileID_01 = fopen(out_01,'a');
fprintf(fileID_01,'%.6g ',n0(1,1));
%----------------------
file_11 = 'neff_11.txt';
out_11 = fullfile(dir_path,file_11);
fileID_11 = fopen(out_11,'a');
fprintf(fileID_11,'%.6g ',n1(1,1));
%----------------------
file_21 = 'neff_21.txt';
out_21 = fullfile(dir_path,file_21);
fileID_21 = fopen(out_21,'a');
fprintf(fileID_21,'%.6g ',n2(1,1));
%----------------------
end
copyfile('test.m','design4aba/test.m')