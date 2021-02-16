clear all
close all


%%

vel_mud = load('velocity_small2016.mat');
depth = load('water_depth.mat');

%%

%M2
m2_max = vel_mud.Vel_M2.Lsmaj;          %583x415
m2_min = vel_mud.Vel_M2.Lsmin;          %583x415
m2_angle = vel_mud.Vel_M2.theta;        %583x415
m2_phase = vel_mud.Vel_M2.phi;          %583x415

x_vel = vel_mud.X;
y_vel = vel_mud.Y;

x_data = load('x.mat');
y_data = load('y.mat');
x_depth =x_data(:,:);      %592x718 
x_depth=x_depth.x/1000;     %592x718
y_depth =y_data(:,:);       %592x718
y_depth=y_depth.y/1000;     %592x718
depth = depth.depth(:,:);    %592x718


  


%%

X= zeros (583,415,100) ;
Y= zeros (583,415,100);

for i =1:583
   for k = 1:415
        [X(i,k,:),Y(i,k,:)] = calculateEllipse(0,0, m2_max(i,k)*100, m2_min(i,k)*100, m2_angle(i,k), 100);
   end
end
      %
      
locx = squeeze(X(296,56,:));
locy = squeeze(Y(296,56,:));
%%
figure;
plot(locx, locy);% hold on; scatter(0,0,'.k','linewidth',20)

%%
figure;
% pcolor(depth.data.X,depth.data.Y,depth);  shading interp; colorbar; colormap(jet);
pcolor(x_depth,y_depth,depth);  shading interp; colorbar; colormap(jet);

hold on;
for i =1:38:583
   for k = 1:30:415
       if m2_max(i,k)/m2_min(i,k)>0;
        plot(x_vel(i,k)/1000+squeeze(X(i,k,:))/5,y_vel(i,k)/1000+squeeze(Y(i,k,:))/5,'black','linewidth',0.8); hold on;
       else m2_max(i,k)/m2_min(i,k)>0;
        plot(x_vel(i,k)/1000+squeeze(X(i,k,:))/5,y_vel(i,k)/1000+squeeze(Y(i,k,:))/5,'-.k','linewidth',0.8); hold on;
       end
   end
end


 title('Tidal Ellipse');   ylabel('y coordinate UTM21N [km]'); xlabel('x coordinate UTM21N [km]');
  ylim([640 710]); xlim([525 674]); daspect([1,1,1]); caxis([0 40]);
     saveas(gcf,'tidal_ellipse2016.png')
     









%% %%%%%%%%%%%%%%%%%%%%%%%%%%% harmonic analysis water level 


WL=load('WL_coupling_nomud_wind_2016');

%% 

WL_x = WL.X;
WL_y= WL.Y;
%%
figure;
subplot(3,1,1)
pcolor(WL_x/1000,WL_y/1000,WL.WL.M0); shading interp; colorbar; colormap(jet);
 cb = colorbar();   lim=caxis; caxis([0 0.5]);  
   title('M0 amplitude [m]');
    ylabel('Crossshore Distance [km]'); xlabel('Alongshore Distance [km]');
subplot(3,1,2)
pcolor(WL_x/1000,WL_y/1000,WL.WL.M2.A); shading interp; colorbar; colormap(jet);
 cb = colorbar();   lim=caxis;% caxis([0 1.2]);  
   title('M2 Amplitude [m]');
    ylabel('Crossshore Distance [km]'); xlabel('Alongshore Distance [km]');
subplot(3,1,3)
pcolor(WL_x/1000,WL_y/1000,WL.WL.M4.A); shading interp; colorbar; colormap(parula);
 cb = colorbar();   lim=caxis;% caxis([0 1.2]);  
   title('M4 Amplitude [m]');
    ylabel('Crossshore Distance [km]'); xlabel('Alongshore Distance [km]');

     saveas(gcf,'WL amplitudes2016.png')
     
     
     %%
figure;
subplot(3,1,1)
pcolor(WL_x/1000,WL_y/1000,WL.WL.M2.phi); shading interp; colorbar; colormap(jet);
 cb = colorbar();%   lim=caxis; caxis([0 360]);  
   title('M2 Phase [deg]');
    ylabel('Crossshore Distance [km]'); xlabel('Alongshore Distance [km]');
subplot(3,1,2)
pcolor(WL_x/1000,WL_y/1000,WL.WL.M4.phi); shading interp; colorbar; colormap(jet);
 cb = colorbar();   %lim=caxis;caxis([0 360]);  
   title('M4 Phase [deg]');
    ylabel('Crossshore Distance [km]'); xlabel('Alongshore Distance [km]');
subplot(3,1,3)
pcolor(WL_x/1000,WL_y/1000,WL.WL.M4.phi-2*WL.WL.M2.phi); shading interp; colorbar; colormap(parula);
 cb = colorbar();%   lim=caxis;caxis([0 360]);   
   title('M4-2M2 phase [deg]');
    ylabel('Crossshore Distance [km]'); xlabel('Alongshore Distance [km]');
     
     saveas(gcf,' phase2016.png')
     
 