SigF = .169; %[cm^-1]
SigM = .022; %[cm^-1]

Df = .62; %[cm]
Dm = 0.143; %[cm]

Rf = 0.466; %[cm]
Rm = 0.63; %[cm]

Qo = 293.16; %[W/cm^3]
Qscl = 1.304e-9; %[J/cm] 

H = 400; %[cm]
Vf = 2*pi*H*Rf*Rf; %[cm^3]

Lf = sqrt(Df / SigF); %[cm]
Lm = sqrt(Dm / SigM); %[cm]

S0 = 1.01916e11; %[cm^-3 s^-1]

r_dom = [0:0.001:Rf];
Q = zeros(length(r_dom));
for i = 1:length(r_dom)
    Q(i) = rad_heat_gen(r_dom(i), Qscl, H, Rf, Rm, Dm, Df, Lf, Lm, S0);
end

plot(r_dom, Q)
axis([0,Rf,580,592])