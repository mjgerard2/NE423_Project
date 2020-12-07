load('fine_mesh_HW7');

% Scale radial direction to milimeters and set plotting font size
r_scl = r * 1000;
fnt=16;

%%% Identify Z index of of maximumal temperature 
size_temp = size(temp_2D_mesh);
maximum = max(temp_2D_mesh(1, 1:size_temp(2)));
max_idx = find(temp_2D_mesh(1, 1:size_temp(2)) == maximum);

%%% Determine shifted indices along Z axis
raise_idx = max_idx + round(0.8 * (size_temp(2) - max_idx));
lower_idx = max_idx - round(0.4 * (size_temp(2) - max_idx));

%%% Calculate Stresses
[rad_stress_1, hoop_stress_1] = calculate_stress(r(1:Nf), temp_2D_mesh(1:Nf, max_idx), r_f, Nf);
[rad_stress_2, hoop_stress_2] = calculate_stress(r(1:Nf), temp_2D_mesh(1:Nf, raise_idx), r_f, Nf);
[rad_stress_3, hoop_stress_3] = calculate_stress(r(1:Nf), temp_2D_mesh(1:Nf, lower_idx), r_f, Nf);

%%% Plot Radial Stress
figure(1);
plot(r_scl(2:Nf), rad_stress_1(2:Nf)*1e-9,'color','k','linewidth',3);
hold on
plot(r_scl(2:Nf), rad_stress_2(2:Nf)*1e-9,'color','r','linewidth',3);
plot(r_scl(2:Nf), rad_stress_3(2:Nf)*1e-9,'color','g','linewidth',3);
hold off

grid
xlabel('R [mm]','FontSize',fnt);
ylabel('$\sigma_{r}^{th}$ [GPa]','Interpreter','latex','FontSize',fnt);
title('Radial Stress','FontSize',fnt+2);
figure;

%%% Plot Hoop Stess
figure(2);
plot(r_scl(2:Nf), hoop_stress_1(2:Nf)*1e-9,'color','k','linewidth',3);
hold on
plot(r_scl(2:Nf), hoop_stress_2(2:Nf)*1e-9,'color','r','linewidth',3);
plot(r_scl(2:Nf), hoop_stress_3(2:Nf)*1e-9,'color','g','linewidth',3);
hold off

grid
xlabel('R [mm]','FontSize',fnt);
ylabel('$\sigma_{\theta}^{th}$ [GPa]','Interpreter','latex','FontSize',fnt);
title('Hoop Stress','FontSize',fnt+2);
figure;

%%% Make temperature color map
figure(3);
[R , Z] = meshgrid(r_scl,z);
surf(R,Z,temp_2D_mesh');
view(2), shading interp;

hold on

%%% Make Z slice arrays
z_val_1 = z(max_idx) * ones(1, Nf);
z_val_2 = z(raise_idx) * ones(1, Nf);
z_val_3 = z(lower_idx) * ones(1, Nf);

%%% Overlay Z slice arrays onto temerature color map
z_order = (max(temp_2D_mesh(1,1:size_temp(2)))+1) * ones(1, Nf);

plot3(r_scl(1:Nf), z_val_1, z_order, 'color','k','linewidth',3)
plot3(r_scl(1:Nf), z_val_2, z_order, 'color','r','linewidth',3)
plot3(r_scl(1:Nf), z_val_3, z_order, 'color','g','linewidth',3)

%%% Label Figure
fnt=16;

xlabel('R [mm]','FontSize',fnt);
ylabel('Z [m]','FontSize',fnt);

title(['RZ Temperature Plot. Number of Nodes, fuel = ', num2str(Nf), ', gap = ', num2str(Ng), ', cladding = ', num2str(Nc), ', Z points = ', num2str(M)], 'FontSize',fnt+2);
a = colorbar('EastOutside');
a.Label.String = 'Temperature [K]';
a.Label.FontSize = fnt;

saveas(figure(1),'Radial_Stress');
saveas(figure(2),'Hoop_Stress');
saveas(figure(3),'Temp_Plot');