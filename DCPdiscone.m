Rd = 55e-3; % Radius of disc
Rc1 = 72.1e-3; % Broad Radius of cone
Rc2 = 1.875e-3; % Narrow Radius of cone
Hc = 160e-3; % Vertical height of cone
Fw = 1e-3; % Feed Width
S = 1.75e-3; % Spacing between
ant = discone;
ant.Height = Hc;
ant.ConeRadii = [Rc2 Rc1];
ant.DiscRadius = Rd;
ant.FeedHeight = S;
ant.FeedWidth = Fw;
figure;
show(ant);
title("Discone Antenna Element");
freq = (0.1:0.01:3)*1e9;
[~] = mesh(ant,'MaxEdgeLength',10e-3);
s1 = sparameters(ant,freq);
rfplot(s1);
f = 470e6;
figure;
pattern(ant,f);
p1 = patternElevation(ant,470e6);
p2 = patternElevation(ant,862e6);
p3 = patternElevation(ant,1.5e9);
p4 = patternElevation(ant,3e9);
figure;
polarpattern(p1);
hold on;
polarpattern(p2);
polarpattern(p3);
polarpattern(p4);
legend ({'470MHz' '862MHz' '1500M','3000M'})