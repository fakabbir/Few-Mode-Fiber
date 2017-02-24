clear all
wave=[1528.5 1529.0 1529.5 1530 1530.5 1531.0 1531.5]*1e-9+20e-9;
%wave=1550e-9;
global k_stepness ;
for j_profile=0.2:.2:6,
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
if 0,
for i=1:length(wave),
    [neffr]=modesolv_l(wave(i),3,0,1);
    nil=5-length(neffr);
    bzero=zeros(1,nil);
    n3(i,:)=[neffr bzero];
end

for i=1:length(wave),
    [neffr]=modesolv_l(wave(i),4,0,1);
    nil=5-length(neffr);
    bzero=zeros(1,nil);
    n4(i,:)=[neffr bzero];
end

for i=1:length(wave),
    [neffr]=modesolv_l(wave(i),5,0,1);
    nil=5-length(neffr);
    bzero=zeros(1,nil);
    n5(i,:)=[neffr bzero];
end
end
neff01=n0(:,1)';
%neff02=n0(:,2)';
%neff03=n1(:,3)';

neff11=n1(:,1)';
%neff12=n1(:,2)';
%neff13=n1(:,3)';

neff21=n2(:,1)';
%neff22=n2(:,2)';
%neff23=n2(:,3)';

%neff31=n3(:,1)';
%neff41=n4(:,1)';
%neff51=n5(:,1)';

c_light=3e8;

factor1=(neff11-neff01);
factor2=(gradient(neff11,wave)-gradient(neff01,wave));
DMD_11_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2);


factor1=(neff21-neff01);
factor2=(gradient(neff21,wave)-gradient(neff01,wave));
DMD_21_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2);

if 0,
factor1=(neff31-neff01);
factor2=(gradient(neff31,wave)-gradient(neff01,wave));
DMD_31_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2);

factor1=(neff41-neff01);
factor2=(gradient(neff41,wave)-gradient(neff01,wave));
DMD_41_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2);

factor1=(neff51-neff01);
factor2=(gradient(neff51,wave)-gradient(neff01,wave));
DMD_51_01=1e+12.*((1/c_light).*factor1-(wave./c_light).*factor2);
end
dmd1=sum(DMD_11_01)/length(DMD_11_01);
dmd2=sum(DMD_21_01)/length(DMD_21_01);
%dmd3=sum(DMD_31_01)/length(DMD_31_01);
%dmd4=sum(DMD_41_01)/length(DMD_41_01);
%dmd5=sum(DMD_51_01)/length(DMD_51_01);

fileID_n01 = fopen('neff_01neg.txt','a');
fprintf(fileID_n01,'%.6g ',n0(1,1));
fileID_n11 = fopen('neff_11neg.txt','a');
fprintf(fileID_n11,'%.6g ',n1(1,1));
fileID_n21 = fopen('neff_21neg.txt','a');
fprintf(fileID_n21,'%.6g ',n2(1,1));


fileID_11 = fopen('dmd_11neg.txt','a');
fprintf(fileID_11,'%.6g ',dmd1);
fileID_21 = fopen('dmd_21neg.txt','a');
fprintf(fileID_21,'%.6g ',dmd2);
if 0,
fileID_31 = fopen('dmd_31neg.txt','a');
fprintf(fileID_31,'%.6g ',dmd3);
fileID_41 = fopen('dmd_41neg.txt','a');
fprintf(fileID_41,'%.6g ',dmd4);
fileID_51 = fopen('dmd_51neg.txt','a');
fprintf(fileID_51,'%.6g ',dmd5);
end
end

%fileID = fopen('dmd_val1std0.txt','a');
%fprintf(fileID,'%e\n',dmd1);
%fileID = fopen('dmd_val2std0.txt','a');
%fprintf(fileID,'%e\n',dmd2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%fileID = fopen('a185.txt','a');
%fprintf(fileID,'%e\n',neff01);
%fileID = fopen('a285.txt','a');
%fprintf(fileID,'%e\n',neff02);
%fileID = fopen('a385.txt','a');
%fprintf(fileID,'%e\n',neff11);
%fileID = fopen('a485.txt','a');
%fprintf(fileID,'%e\n',neff21);
%fileID = fopen('a585.txt','a');
%fprintf(fileID,'%e\n',neff31);