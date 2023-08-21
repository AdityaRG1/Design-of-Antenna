Lgnd = 45e-3;
Wgnd = 40e-3;
Ls = 5e-3;
Ltaper = 28.5e-3;
Wtaper = 39.96e-3;
s = 0.4e-3;
d = 5e-3;
Ka = (1/Ltaper)*(log(Wtaper/s)/log(exp(1)));
vivaldiant = vivaldi('TaperLength',Ltaper, 'ApertureWidth', Wtaper, ...
'OpeningRate', Ka,'SlotLineWidth', s, ...
'CavityDiameter',d,'CavityToTaperSpacing',Ls, ...
'GroundPlaneLength', Lgnd, 'GroundPlaneWidth', Wgnd,...
'FeedOffset',-10e-3);
figure
show(vivaldiant);
vivaldiant.FeedOffset = -14e-3;
ewant = pcbStack(vivaldiant);
topLayer = ewant.Layers{1};
figure;
show(topLayer);
cutout = antenna.Rectangle('Length',1e-3,'Width',4e-3,'Center',[-0.014,0]);
topLayer = topLayer-cutout;
figure;
show(topLayer);

L1 = 8e-3;
L2 = 4.1e-3;
L3 = 9.1e-3;
W1 = 1.5e-3;
W2 = 1e-3;
W3 = 0.75e-3;
H = 0.8e-3;
fp = 11.2e-3;
th = 90;
patch1 = antenna.Rectangle('Length',L1,'Width',W1,...
'Center',[-(Lgnd/2 - L1/2), -(Wgnd/2 - fp - W1/2)],...
'NumPoints', [10,2,10,2]);
patch2 = antenna.Rectangle('Length',L2,'Width',W2,'Center',[-(Lgnd/2 - L1 - L2/2), -(Wgnd/2 - fp - W1/2)],'NumPoints', [5,2,5,2]);
patch3 = antenna.Rectangle('Length',W3,'Width',L3,'Center',[-(Lgnd/2 - L1 - L2 - W3/2), -(Wgnd/2 - fp - W1/2 + W2/2- L3)],'NumPoints', [2,10,2,10]);
Bowtie = em.internal.makebowtie(8.55e-3, W3, th, [0 0 0],'rounded',20);
rotatedBowtie = em.internal.rotateshape(Bowtie,[0 0 1],[0 0 0],90);
p = antenna.Polygon('Vertices', rotatedBowtie');
radialStub = translate(p, [-(Lgnd/2 - L1 - L2 - W3/2) -(Wgnd/2 - fp - W1/2 + W2/2- L3) 0]);
bottomLayer = patch1+patch2+patch3+radialStub;
figure;
show(bottomLayer);
boardShape = antenna.Rectangle('Length',Lgnd,'Width',Wgnd);

figure;
hold on;
plot(topLayer)
plot(bottomLayer)
grid on
substrate = dielectric('Name','FR4','EpsilonR', 4.4, 'Thickness', H);
vivaldi_Notch = pcbStack;
vivaldi_Notch.Name = 'vivaldiNotch';
vivaldi_Notch.BoardThickness = H;
vivaldi_Notch.BoardShape = boardShape;
vivaldi_Notch.Layers = {topLayer,substrate,bottomLayer};
vivaldi_Notch.FeedLocations = [-(Lgnd/2), -(Wgnd/2 - fp - W1/2), 1, 3];
vivaldi_Notch.FeedDiameter = W1/2;
figure;
show(vivaldi_Notch);