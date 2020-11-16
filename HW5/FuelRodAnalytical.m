%% NE 423 HW3 ~Computational Part~
% Aysia Demby
% Michael Gerard
% Lewis Gross

% This script will compute the analytical temperature profile for a fuel
% rod model as done in class. It will accept values from the user for the
% parameters of interest

%% README IMPORTANT
% if you want to prompt the user, just run the code

% if you want to replicate the plot made in the homework submission,
% enter "load repopulate.mat" in the command window
% comment out the prompts and re-run the code

% comment out clearing if undesired
% clear; clc;
% format long;


% Prompt user for above parameters
% LHR = input(' S''il vous plait, enter the linear heat rate in [W/m]: ');
% r_f = input(' S''il vous plait, enter the fuel radius in [m]:');
% d_g = input(' S''il vous plait, enter the gap thickness in [m]:');
% d_c = input(' S''il vous plait, enter the cladding thickness in [m]:');
% k_f = input(' S''il vous plait, enter the fuel thermal conductivity in [W/m-K]: ');
% k_g = input(' S''il vous plait, enter the gap thermal conductivity  in [W/m-K]: ');
% k_c = input(' S''il vous plait, enter the cladding thermal conductivity  in [W/m-K]: ');
% h_cool = input(' S''il vous plait, enter the heat transfer coefficient in [W/m^2-K]:');
% T_cool = input(' S''il vous plait, enter the coolant temperature in K: ') ;

% radii
r_g = r_f + d_g; % gap outer radius
r_c = r_g + d_c; % cladding outer radius

T_0 = T_cool + LHR*( 1/(4*pi*k_f) + d_g/(2*pi*k_g*r_f) + ...
      log(1+(d_c/r_f))/(2*pi*k_c) + 1/(2*pi*h_cool*r_c) ) ;

T_CO = T_cool + LHR/(2*pi*h_cool*r_c);
T_CI = T_CO + LHR*log(1+(d_c/r_f))/(2*pi*k_c);
T_S = T_CI + LHR*d_g/(2*pi*k_g*r_f);
T_0_check = T_S + LHR/(4*pi*k_f);

fuel_grid = linspace(0,r_f,200) ;
gap_grid = linspace(r_f,r_g,100) ;
clad_grid = linspace(r_g,r_c,150) ;

T_f = T_S + LHR/(4*pi*k_f)*(1-(fuel_grid.^2)/r_f^2) ;
T_g = T_S - LHR/(2*pi*k_g)*log(gap_grid/r_f);
T_c = T_CI - LHR/(2*pi*k_c)*log(clad_grid/(r_f+d_g));

h= plot(fuel_grid,T_f,'b',gap_grid,T_g,'r',clad_grid,T_c,'g');
xlabel('Radius [m]')
ylabel('Temperature [K]')
set(h(1),'linewidth',4) ;
set(h(2),'linewidth',4) ;
set(h(3),'linewidth',4) ;
legend('fuel','gap','cladding')
title('The Temperature Distribution for a Fuel Pin with Values from Class')