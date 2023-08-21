FL = 0.0348;
FW = 0.035;
FH = 0.035;
L = 0.03;
W = 0.024;
H=0.012;
FO=[0.01 0];
ant1 = horn('FlareLength',FL,'FlareWidth',FW,'FlareHeight',FH,'Length',L,...
'Width',W,'Height',H,'FeedOffset',FO);
figure;
show(ant1);
R = 0.012;
WH = 0.03;
CH = 0.0348;
AR = 0.035;
figure;
ant2 = hornConical('Radius',R,'WaveguideHeight',WH,'ConeHeight',CH,'ApertureRadius',AR);
show(ant2);
z1=0.006;
p=0.002;
w=0.0008;
d1=0.004;

ar=0.018;
ch=0.0348;
ant3 = hornConicalCorrugated('FirstCorrugateDistance',z1,'Pitch',p,'CorrugateWidth'...
,w,'CorrugateDepth',d1,'ConeHeight',ch,'ApertureRadius',ar);
show(ant3);
xlim([0 60]);
zlim([0 10]);
view(-88,35);
FL = 0.0348;
FW = 0.035;
FH = 0.035;
L = 0.03;
W = 0.024;
H=0.012;
FCD=0.01;
CD=[0.005 0.0075];
ant4 = hornCorrugated('FlareLength',FL,'FlareWidth',FW,'FlareHeight',FH,'Length',L,...
'Width',W,'Height',H,'FirstCorrugateDistance',FCD,'CorrugateDepth',CD);
show(ant4);