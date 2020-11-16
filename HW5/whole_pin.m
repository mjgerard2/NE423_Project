%% NE 423 HW3 ~Computational Part~
% Aysia Demby
% Michael Gerard
% Lewis Gross

% This script will compute the analytical temperature profile for a fuel
% rod model as done in class. It will accept values from the user for the
% parameters of interest

LHR = 20000 ;
r_f = 0.005 ;
d_g = 5e-05 ;
k_f = 3 ;
k_g = 0.25 ;
k_c = 17 ;
h_cool = 25000 ;
T_cool = 580 ;

fuel_grid = linspace(0,r_f,200) ;
gap_grid = linspace(r_f,r_g,150) ;
clad_grid = linspace(r_g,r_c,200) ;
full_grid = [fuel_grid(1:end-1) gap_grid(1:end-1) clad_grid];

Tvec = fuel_temp_analytical(LHR,r_f,d_g,d_c,k_f,k_g,k_c,h_cool,T_cool,fuel_grid, gap_grid, clad_grid);

h= plot(full_grid, Tvec);
xlabel('Radius [m]')
ylabel('Temperature [K]')
title('The Temperature Distribution for a Fuel Pin with Values from Class')