
% Define antenna dimensions and parameters
w = 18.5e-3;    % patch width
l = 26.5e-3;    % patch length
d = 4.6e-3;     % substrate thickness
h = 63.5e-3;% ground plane height
r= 63.5e-3;      % substrate relative permittivity
f = 2.45e9;     % operating frequency

% Create PIFA antenna object
ant = pifa('Length',l, 'Width', w, 'Height', d, 'GroundPlaneLength', h, 'GroundPlaneWidth',r, 'ShortPinWidth',w);
figure;
show(ant);
% Define port impedance
%Zin = 50;       % input impedance
%port_location = [l/2, w/2, 0];  % port location

%p.Port = port('Position', port_location, 'Impedance', Zin);

% Calculate S-parameters
freq_range = linspace(2.4e9, 2.5e9, 501); % frequency range
S = sparameters(ant, freq_range);

% Plot S-parameters
figure;
rfplot(S);

% Calculate and plot reflection coefficient
Gamma = s2g(S.Parameters);
figure;
plot(freq_range/1e9, 20*log10(abs(Gamma)));
xlabel('Frequency (GHz)');
ylabel('Reflection coefficient (dB)');

