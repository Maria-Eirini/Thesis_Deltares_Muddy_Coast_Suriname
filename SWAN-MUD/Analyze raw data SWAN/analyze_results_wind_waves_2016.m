%% formulations_comparison
close all

   %% test
    figure;
    %subplot(3,1,1); 
      pcolor((x)/1000,(y)/1000,DELFT_dissip_surf_mud_wind_waves); shading interp; h=colorbar; colormap(jet);
         ylim([640 721]); xlim([482 655]); lim=caxis;     
ylabel('X coordinate UTM21N[km]');xlabel('X coordinate UTM21N [km]');  caxis([0 0.0001]); 
yline(663,'linewidth',2);hold on; xline(614,'linewidth',2);
hold on; scatter(516,662,100,'black','x' ); daspect([1 1 1])
hold on; scatter(520,680,100,'yellow','x' ); hold on; scatter(517,692,100,'red','x' ); hold on;
%      subplot(3,1,2); daspect([1 1 1])
%            pcolor((x)/1000,(y)/1000,DEWIT_dissip_surf_mud_wind_waves); shading interp;colormap(jet);  h=colorbar;
%     ylim([647 725.9]); xlim([537.8 822.8]); hold on;%yline(677, 'red', 'linewidth',2); hold on; xline(699,'red','linewidth',2)  
%    title('no mud');  cb = colorbar(); lim=caxis; caxis([0 0.005]);   % cb.Ruler.Exponent = -3;    
%     ylabel('X coordinate UTM21N[km]');xlabel('X coordinate UTM21N [km]'); 
%     subplot(3,1,3 )     
%     pcolor((x)/1000,(y)/1000,DEWIT_dissip_wcap_mud_wind_waves); shading interp;colormap(jet);  h=colorbar;
%     ylim([647 725.9]); xlim([537.8 822.8]); hold on;%yline(677, 'red', 'linewidth',2); hold on; xline(699,'red','linewidth',2)  
%    title('wcap');  cb = colorbar(); lim=caxis; caxis([0.005]);   % cb.Ruler.Exponent = -3;    
%     ylabel('X coordinate UTM21N[km]');xlabel('X coordinate UTM21N [km]');  daspect([1 1 1])
%      %lon=699500;       lat=677000;
      saveas(gcf,'mudbanks_2016spatial.png')

     %%
     figure;
          subplot(3,3,1); daspect([1 1 1]) 
    pcolor((x)/1000,(y)/1000,DELFT_hsig_mud_wind_waves); shading interp; h=colorbar; colormap(jet);
    title('Significant Wave Height, DELFT ');      ylim([640 721]); xlim([482 655]); lim=caxis;     
  ylabel('Y coordinate UTM21N [km]'); set(get(h,'title'),'string','[m]'); caxis([0 2.5]);
subplot(3,3,2); daspect([1 1 1])
    pcolor((x)/1000,(y)/1000,DELFT_tm01_mud_wind_waves); shading interp; h=colorbar; colormap(jet);
    title('Wave period, DELFT ');    ylim([640 721]); xlim([482 655]);lim=caxis;  caxis([0 8]); 
    set(get(h,'title'),'string','[s]');%ylabel('Y coordinate UTM21N [km]')'); xlabel('X  coordinate UTM21N [km]');
    subplot(3,3,3); daspect([1 1 1])
    pcolor((x)/1000,(y)/1000,DELFT_dissip_total_mud_wind_waves);  shading interp; h=colorbar; colormap(jet); 
  lim=caxis; caxis([0 0.0005]);     ylim([640 721]); xlim([482 655]);
   title('Total dissipation, DELFT');  set(get(h,'title'),'string','[m^/s]');
 
   subplot(3,3,4); daspect([1 1 1])
    pcolor((x)/1000,(y)/1000,GADE_hsig_mud_wind_waves); shading interp; h=colorbar; colormap(jet);
    title('Significant Wave Height, Gade');       ylim([640 721]); xlim([482 655]);lim=caxis; 
    caxis([0 2.5]);; set(get(h,'title'),'string','[m]');;ylabel('Y coordinate UTM21N [km]')
subplot(3,3,5); daspect([1 1 1])
    pcolor((x)/1000,(y)/1000,GADE_tm01_mud_wind_waves); shading interp; h=colorbar; colormap(jet);
    title('Wave period, Gade');    ylim([640 721]); xlim([482 655]);lim=caxis;   caxis([0 8]);
 set(get(h,'title'),'string','[s]');   %ylabel('Y coordinate UTM21N [km]')'); xlabel('X  coordinate UTM21N [km]');
    subplot(3,3,6); daspect([1 1 1])
    pcolor((x)/1000,(y)/1000,GADE_dissip_total_mud_wind_waves);  shading interp; h=colorbar; colormap(jet); 
  lim=caxis;  caxis([0 0.0005]);      ylim([640 721]); xlim([482 655]);
   title('Total dissipation, Gade'); set(get(h,'title'),'string','[m^/s]'); 

    
              subplot(3,3,7)
    pcolor((x)/1000,(y)/1000,NOMUD_hsig_mud_wind_waves); shading interp; h=colorbar; colormap(jet);
    title('Significant Wave Height, No mud');       ylim([640 721]); xlim([482 655]);lim=caxis; 
    ylabel('Y coordinate UTM21N [km]'); xlabel('X  coordinate UTM21N [km]');caxis([0 2.5]);set(get(h,'title'),'string','[m]'); 
subplot(3,3,8); daspect([1 1 1])
    pcolor((x)/1000,(y)/1000,NOMUD_tm01_mud_wind_waves); shading interp; h=colorbar; colormap(jet);
    title('Wave period, No mud');    ylim([640 721]); xlim([482 655]);lim=caxis;    caxis([0 8]);
   set(get(h,'title'),'string','[s]'); xlabel('X  coordinate UTM21N [km]');
    subplot(3,3,9); daspect([1 1 1])
    pcolor((x)/1000,(y)/1000,NOMUD_dissip_total_mud_wind_waves);  shading interp; h=colorbar; colormap(jet); 
  lim=caxis; caxis([0 0.0005]);     ylim([640 721]); xlim([482 655]);
   title('Total dissipation, No mud'); set(get(h,'title'),'string','[m^/s]');
     xlabel('X  coordinate UTM21N [km]');  xlabel('X  coordinate UTM21N [km]');
   
 saveas(gcf,'wind_waves_hsig_period_dissip_2016spatial.png')
%%
DELFT_wave_dir_mud_wind_waves = wrapTo180(DELFT_wave_dir_mud_wind_waves);
DELFT_wave_dir_mud_wind_waves = round(DELFT_wave_dir_mud_wind_waves);
u_d= mod( 270-DELFT_wave_dir_mud_wind_waves, 360);      u_d=  cos(u_d * pi/180) ;
v_d =mod(270-DELFT_wave_dir_mud_wind_waves, 360) ;      v_d =  sin(v_d* pi/180) ;

GADE_wave_dir_mud_wind_waves = wrapTo180(GADE_wave_dir_mud_wind_waves);
 GADE_wave_dir_mud_wind_waves = round(GADE_wave_dir_mud_wind_waves);
u_g= mod( 270-GADE_wave_dir_mud_wind_waves, 360);  u_g=cos(u_g * pi/180) ;
 v_g= mod(270-GADE_wave_dir_mud_wind_waves, 360);   v_g=sin(v_g* pi/180);

 NOMUD_wave_dir_mud_wind_waves = wrapTo180(NOMUD_wave_dir_mud_wind_waves);
NOMUD_wave_dir_mud_wind_waves = round(NOMUD_wave_dir_mud_wind_waves);
u_nm= mod( 270-NOMUD_wave_dir_mud_wind_waves, 360) ;  u_nm=  cos(u_nm * pi/180) ;
 v_nm= mod(270-NOMUD_wave_dir_mud_wind_waves, 360) ; v_nm=  sin(v_nm* pi/180) ;
 %%


figure;
          subplot(3,2,1); daspect([1 1 1]) 
    pcolor((x)/1000,(y)/1000,mudl_mud); shading interp; h=colorbar; colormap(parula);
    title('Wave direction      , DELFT ');      ylim([640 721]); xlim([482 655]); lim=caxis;  
    hold on;    quiver(x(1:160:end)/1000,y(1:160:end)/1000,u_d(1:160:end),v_d(1:160:end),1,'black');
  ylabel('Y coordinate UTM21N [km]');set(get(h,'title'),'string','Mud layer [m]');
subplot(3,2,2); daspect([1 1 1])
    pcolor((x)/1000,(y)/1000,DELFT_ubot_mud_wind_waves); shading interp; h=colorbar; colormap(jet);
    title('Orbital velocity, DELFT ');    ylim([640 721]); xlim([482 655]);lim=caxis;  caxis([0 1]); 
    set(get(h,'title'),'string','[m/s]');
   
%               subplot(4,2,3); daspect([1 1 1])
%     pcolor((x)/1000,(y)/1000,DEWIT_wave_dir_mud_wind_waves); shading interp; h=h=colorbar; colormap(jet); ylabel('Y coordinate UTM21N [km]')
%     title('Wave direction, De Wit');       ylim([640 721]); xlim([482 655]);lim=caxis; 
%    ylabel('Y coordinate UTM21N [km]');  xlabel('X  coordinate UTM21N [km]'); set(get(h,'title'),'string','Mud layer [m]');    
% subplot(4,2,4); daspect([1 1 1])
%     pcolor((x)/1000,(y)/1000,DEWIT_ubot_mud_wind_waves); shading interp; h=h=colorbar; colormap(jet);
%     title('Orbital velocity, De Wit ');    ylim([640 721]); xlim([482 655]);lim=caxis;    caxis([0 2]);
%   set(get(h,'title'),'string','[m/s]');  

              subplot(3,2,3); daspect([1 1 1])
    pcolor((x)/1000,(y)/1000,mudl_mud); shading interp; h=colorbar; colormap(parula);
        hold on;    quiver(x(1:160:end)/1000,y(1:160:end)/1000,u_g(1:160:end),v_g(1:160:end),1,'black');
    title('Wave direction      , Gade');       ylim([640 721]); xlim([482 655]);lim=caxis; 
    set(get(h,'title'),'string','Mud layer [m]'); ylabel('Y coordinate UTM21N [km]');
subplot(3,2,4); daspect([1 1 1])
    pcolor((x)/1000,(y)/1000,GADE_ubot_mud_wind_waves); shading interp; h=colorbar; colormap(jet);
    title('Orbital velocity, Gade');    ylim([640 721]); xlim([482 655]);lim=caxis;   caxis([0 1]);
    set(get(h,'title'),'string','[m/s]');  %ylabel('Y coordinate UTM21N [km]')'); xlabel('X  coordinate UTM21N [km]');

    
    
              subplot(3,2,5);  daspect([1 1 1])
    pcolor((x)/1000,(y)/1000,depth); shading interp; h=colorbar; colormap(jet);
    title('Wave direction      , No mud');       ylim([640 721]); xlim([482 655]);lim=caxis; 
        hold on;    quiver(x(1:160:end)/1000,y(1:160:end)/1000,u_nm(1:160:end),v_nm(1:160:end),1,'black'); caxis([0 60])
    ylabel('Y coordinate UTM21N [km]'); xlabel('X  coordinate UTM21N [km]');set(get(h,'title'),'string','Depth [m]');
subplot(3,2,6); daspect([1 1 1])
    pcolor((x)/1000,(y)/1000,NOMUD_ubot_mud_wind_waves); shading interp; h=colorbar; colormap(parula);
    title('Orbital velocity, No mud');    ylim([640 721]); xlim([482 655]);lim=caxis;    caxis([0 1]);
    set(get(h,'title'),'string','[m/s]'); xlabel('X  coordinate UTM21N [km]');

 saveas(gcf,'forced_waves_direction_orbital2016_spatial.png')
 
 
 %% dissip_sources alongshore section
  figure; %sgtitle('Dissipation sources, Alongshore section at x=681km');
subplot(5,1,5); daspect([1 1 1])
    plot((x(:,134))/1000,-depth(:,134)-mudl_mud(:,134),'red','linewidth',2);
    hold on; plot((x(:,134))/1000,-depth(:,134),'blue','linewidth',2); %xlim([481 720]);
        text(-3,-5,'Land','Color','cyan','FontSize',14);  xlabel('X coordinate UTM21N[km]');
        text(75,-10,'Ocean','Color','cyan','FontSize',14)
        legend('Mud layer','Depth'); grid on;  grid minor;
    title('Depth'); ylabel('Depth'); title('Bottom profile')
    
    subplot(5,1,1); daspect([1 1 1])
    plot((x(:,134))/1000,DELFT_dissip_total_mud_wind_waves(:,134),'red','linewidth',2); hold on
    % plot((x(:,134))/1000,DEWIT_dissip_total_mud_wind_waves(:,134),'blue','linewidth',2); hold on
         plot((x(:,134))/1000,GADE_dissip_total_mud_wind_waves(:,134),'cyan','linewidth',1); hold on
     plot((x(:,134))/1000,NOMUD_dissip_total_mud_wind_waves(:,134),'black','linewidth',0.5); 
ylim([0 1.2e-3]);   grid on;  grid minor; xlim([488 720]);
legend('DELFT', 'Gade'); title('Total dissipation '); ylabel('Dissipation m^2/s');

    subplot(5,1,2); daspect([1 1 1])
        plot((x(:,134))/1000,DELFT_dissip_mud_wind_waves(:,134),'red','linewidth',2); hold on
    % plot((x(:,134))/1000,DEWIT_dissip_mud_wind_waves(:,134),'blue','linewidth',2); hold on
              plot((x(:,134))/1000,GADE_dissip_mud_wind_waves(:,134),'cyan','linewidth',1); hold on
     xlim([488 720]);ylim([0 0.5e-3]);    grid on;  grid minor; 
legend('DELFT','Gade')
title('Mud induced dissipation')
ylabel('Dissipation m^2/s');

 subplot(5,1,3); daspect([1 1 1])
         plot((x(:,134))/1000,DELFT_dissip_surf_mud_wind_waves(:,134),'red','linewidth',2); hold on
%      plot((x(:,134))/1000,DEWIT_dissip_surf_mud_wind_waves(:,134),'blue','linewidth',2); hold on
              plot((x(:,134))/1000,GADE_dissip_mud_wind_waves(:,134),'cyan','linewidth',1); hold on
                   plot((x(:,134))/1000,NOMUD_dissip_surf_mud_wind_waves(:,134),'black','linewidth',0.5); 
    xlim([488 720]);ylim([0 1.2e-3]);    grid on;  grid minor; 
legend('DELFT','Gade','No mud case')
title('Dissipation due to wave breaking')
ylabel('Dissipation m^2/s');

 subplot(5,1,4); daspect([1 1 1])
         plot((x(:,134))/1000,DELFT_dissip_wcap_mud_wind_waves(:,134),'red','linewidth',2); hold on
%      plot((x(:,134))/1000,DEWIT_dissip_surf_mud_wind_waves(:,134),'blue','linewidth',2); hold on
              plot((x(:,134))/1000,GADE_dissip_wcap_mud_wind_waves(:,134),'cyan','linewidth',1); hold on
                   plot((x(:,134))/1000,NOMUD_dissip_wcap_mud_wind_waves(:,134),'black','linewidth',0.5); 
    xlim([488 720]);ylim([0 0.2e-3]);    grid on;  grid minor; 
legend('DELFT','Gade','No mud case')
title('Dissipation due to white-capping')
ylabel('Dissipation m^2/s');

  saveas(gcf,'wind_waves_dissipation_sources_alongshore2016.png')
         
 
 %% sgtitle('Dissipation sources, crosshore ');
 figure;
subplot(5,1,5); daspect([1 1 1])
    plot((y(329,:))/1000,-depth(329,:)-mudl_mud(329,:),'red','linewidth',2);
    hold on; plot((y(329,:))/1000,-depth(329,:),'blue','linewidth',2); %xlim([537.8 822.8]);
        text(-3,-5,'Land','Color','cyan','FontSize',14);  xlabel('Y coordinate UTM21N[km]');
        text(75,-10,'Ocean','Color','cyan','FontSize',14); ylim([-40 0]);xlim([643 690]); 
        legend('Mud layer','Depth'); grid on;  grid minor;
    title('Depth'); ylabel('Depth'); title('Bottom profile')
    
    subplot(5,1,1); daspect([1 1 1])
    plot((y(329,:))/1000,DELFT_dissip_total_mud_wind_waves(329,:),'red','linewidth',2); hold on
%      plot((y(329,:))/1000,DEWIT_dissip_total_mud_wind_waves(329,:),'blue','linewidth',2); hold on
         plot((y(329,:))/1000,GADE_dissip_total_mud_wind_waves(329,:),'cyan','linewidth',2); hold on
     plot((y(329,:))/1000,NOMUD_dissip_total_mud_wind_waves(329,:),'black','linewidth',1); 
ylim([0 0.3e-3]);   grid on;  grid minor; xlim([643 690]);
legend('DELFT', 'Gade','No mud case')
title('Total dissipation ')
ylabel('Dissipation m^2/s');

    subplot(5,1,2); daspect([1 1 1])
        plot((y(329,:))/1000,DELFT_dissip_mud_wind_waves(329,:),'red','linewidth',2); hold on
%      plot((y(329,:))/1000,DEWIT_dissip_mud_wind_waves(329,:),'blue','linewidth',2); hold on
              plot((y(329,:))/1000,GADE_dissip_mud_wind_waves(329,:),'cyan','linewidth',1); hold on
  ylim([0 0.2e-3]);    grid on;  grid minor; xlim([643 690]);
legend('DELFT','Gade'); title('Mud induced dissipation'); ylabel('Dissipation m^2/s');

 subplot(5,1,3); daspect([1 1 1])
         plot((y(329,:))/1000,DELFT_dissip_surf_mud_wind_waves(329,:),'red','linewidth',2); hold on
%      plot((y(329,:))/1000,DEWIT_dissip_surf_mud_wind_waves(329,:),'blue','linewidth',2); hold on
              plot((y(329,:))/1000,GADE_dissip_surf_mud_wind_waves(329,:),'cyan','linewidth',2); hold on
                   plot((y(329,:))/1000,NOMUD_dissip_surf_mud_wind_waves(329,:),'black','linewidth',1); %xlim([537.8 822.8]);
     ylim([0 0.2e-3]);    grid on;  grid minor; xlim([643 690]);
legend('DELFT','Gade','No mud case')
title('Dissipation due to wave breaking')
ylabel('Dissipation m^2/s');

 subplot(5,1,4); daspect([1 1 1])
         plot((y(329,:))/1000,DELFT_dissip_wcap_mud_wind_waves(329,:),'red','linewidth',2); hold on
%      plot((y(329,:))/1000,DEWIT_dissip_surf_mud_wind_waves(329,:),'blue','linewidth',2); hold on
              plot((y(329,:))/1000,GADE_dissip_wcap_mud_wind_waves(329,:),'cyan','linewidth',2); hold on
                   plot((y(329,:))/1000,NOMUD_dissip_wcap_mud_wind_waves(329,:),'black','linewidth',1); %xlim([537.8 822.8]);
     ylim([0 0.1e-3]);    grid on;  grid minor; xlim([643 690]);
legend('DELFT','Gade','No mud case')
title('Dissipation due to white-capping')
ylabel('Dissipation m^2/s');

  saveas(gcf,'wind_waves_dissipation_sources_crosshore2016.png')
  %% hsig-dissip-period alongshore section  
figure;
  subplot(6,1,6); daspect([1 1 1])
    plot((x(:,134))/1000,-depth(:,134)-mudl_mud(:,134),'red','linewidth',2);
    hold on; plot((x(:,134))/1000,-depth(:,134),'blue','linewidth',2); xlim([480 720]);
        text(-3,-5,'Land','Color','cyan','FontSize',14);  xlabel('X coordinate UTM21N[km]');
        text(75,-10,'Ocean','Color','cyan','FontSize',14); ylim([-30 0])
        legend('Mud layer','Depth'); grid on;  grid minor;
    title('Depth'); ylabel('Depth'); title('Bottom profile')
    
    subplot(6,1,1); daspect([1 1 1])
    plot((x(:,134))/1000,DELFT_hsig_mud_wind_waves(:,134),'red','linewidth',2); hold on
%      plot((x(:,134))/1000,DEWIT_hsig_mud_wind_waves(:,134),'blue','linewidth',2); hold on
         plot((x(:,134))/1000,GADE_hsig_mud_wind_waves(:,134),'cyan','linewidth',1); hold on
     plot((x(:,134))/1000,NOMUD_hsig_mud_wind_waves(:,134),'black','linewidth',0.5); 
ylim([0 4]);   grid on;  grid minor; xlim([480 720]);
legend('DELFT','Gade','No mud case')
title('Significant wave height ')
ylabel('Wave height [m]');

    subplot(6,1,2); daspect([1 1 1])
        plot((x(:,134))/1000,DELFT_dissip_total_mud_wind_waves(:,134),'red','linewidth',2); hold on
%      plot((x(:,134))/1000,DEWIT_dissip_total_mud_wind_waves(:,134),'blue','linewidth',2); hold on
              plot((x(:,134))/1000,GADE_dissip_total_mud_wind_waves(:,134),'cyan','linewidth',1); hold on
                            plot((x(:,134))/1000,NOMUD_dissip_total_mud_wind_waves(:,134),'black','linewidth',0.5); hold on
      xlim([480 720]); ylim([0 1.2e-3]);    grid on;  grid minor; 
legend('DELFT', 'Gade','No mud case')
title('Total dissipation')
ylabel('Dissipation m^2/s');

 subplot(6,1,3); daspect([1 1 1])
         plot((x(:,134))/1000,DELFT_tm01_mud_wind_waves(:,134),'red','linewidth',2); hold on
%      plot((x(:,134))/1000,DEWIT_tm01_mud_wind_waves(:,134),'blue','linewidth',2); hold on
              plot((x(:,134))/1000,GADE_tm01_mud_wind_waves(:,134),'cyan','linewidth',1); hold on
                   plot((x(:,134))/1000,NOMUD_tm01_mud_wind_waves(:,134),'black','linewidth',0.5); 
      xlim([480 720]);grid on;  grid minor;    %ylim([0 1e-3]);    
legend('DELFT','Gade','No mud case')
title('Peak wave period')
ylabel('Period [s]');

 subplot(6,1,4); daspect([1 1 1])
         plot((x(:,134))/1000,DELFT_wave_dir_mud_wind_waves(:,134),'red','linewidth',2); hold on
%      plot((x(:,134))/1000,DEWIT_wave_dir_mud_wind_waves(:,134),'blue','linewidth',2); hold on
              plot((x(:,134))/1000,GADE_wave_dir_mud_wind_waves(:,134),'cyan','linewidth',1); hold on
                   plot((x(:,134))/1000,NOMUD_wave_dir_mud_wind_waves(:,134),'black','linewidth',0.5); 
  grid on;  grid minor; xlim([480 720]);     %ylim([0 1e-3]);   xlim([537.8 822.8]);   
legend('DELFT','Gade','No mud case')

title('Peak wave direction')
ylabel('Direction [\circ]');

 subplot(6,1,5); daspect([1 1 1])
         plot(x(:,134)/1000,DELFT_ubot_mud_wind_waves(:,134),'red','linewidth',2); hold on
%      plot((x(:,134))/1000,DEWIT_ubot_mud_wind_waves(:,134),'blue','linewidth',2); hold on
              plot((x(:,134))/1000,GADE_ubot_mud_wind_waves(:,134),'cyan','linewidth',1); hold on
                   plot((x(:,134))/1000,NOMUD_ubot_mud_wind_waves(:,134),'black','linewidth',0.5); 
  grid on;  grid minor; xlim([480 720]);    %ylim([0 1e-3]);   xlim([537.8 822.8]);   
legend('DELFT','Gade','No mud case')
title('Orbital velocity')
ylabel('Velocity [m/s]');

  saveas(gcf,'wind_waves_hsig_dissip_period_alongshore2016.png')
  %%     hsig-dissip-period-dir-ubot crosshore section  
  figure; %sgtitle('crosshore section');
subplot(6,1,6); daspect([1 1 1])
    plot((y(329,:))/1000,-depth(329,:)-mudl_mud(329,:),'red','linewidth',2);
    hold on; plot((y(329,:))/1000,-depth(329,:),'blue','linewidth',2); ylim([-40 0]);
        text(-3,-5,'Land','Color','cyan','FontSize',14);  xlabel('Y coordinate UTM21N[km]');
        text(75,-10,'Ocean','Color','cyan','FontSize',14)
        legend('Mud layer','Depth'); grid on;  grid minor; xlim([643 690]);
    title('Depth'); ylabel('Depth'); title('Bottom profile')
    
    subplot(6,1,1); daspect([1 1 1])
    plot((y(329,:))/1000,DELFT_hsig_mud_wind_waves(329,:),'red','linewidth',2); hold on
%      plot((y(329,:))/1000,DEWIT_hsig_mud_wind_waves(329,:),'blue','linewidth',2); hold on
         plot((y(329,:))/1000,GADE_hsig_mud_wind_waves(329,:),'cyan','linewidth',1); hold on
     plot((y(329,:))/1000,NOMUD_hsig_mud_wind_waves(329,:),'black','linewidth',0.5); 
ylim([0 4.2]);   grid on;  grid minor;xlim([643 690]);
legend('DELFT','Gade','No mud case')
title('Significant wave height ')
ylabel('Wave height [m]');

    subplot(6,1,2); daspect([1 1 1])
        plot((y(329,:))/1000,DELFT_dissip_total_mud_wind_waves(329,:),'red','linewidth',2); hold on
%      plot((y(329,:))/1000,DEWIT_dissip_total_mud_wind_waves(329,:),'blue','linewidth',2); hold on
           plot((y(329,:))/1000,GADE_dissip_total_mud_wind_waves(329,:),'cyan','linewidth',1); hold on
   plot((y(329,:))/1000,NOMUD_dissip_total_mud_wind_waves(329,:),'black','linewidth',0.5); hold on
    ylim([0 0.25e-3]);    grid on;  grid minor; xlim([643 690]);
legend('DELFT','Gade','No mud case')
title('Total dissipation')
ylabel('Dissipation m^2/s');

 subplot(6,1,3); daspect([1 1 1])
         plot((y(329,:))/1000,DELFT_tm01_mud_wind_waves(329,:),'red','linewidth',2); hold on
%      plot((y(329,:))/1000,DEWIT_tm01_mud_wind_waves(329,:),'blue','linewidth',2); hold on
              plot((y(329,:))/1000,GADE_tm01_mud_wind_waves(329,:),'cyan','linewidth',1); hold on
                   plot((y(329,:))/1000,NOMUD_tm01_mud_wind_waves(329,:),'black','linewidth',0.5); 
  grid on;  grid minor;  xlim([643 690]);  %ylim([0 1e-3]);   xlim([537.8 822.8]);   
legend('DELFT','Gade','No mud case')
title('Peak wave period')
ylabel('Period [s]');


 subplot(6,1,4); daspect([1 1 1])
         plot((y(329,:))/1000,DELFT_wave_dir_mud_wind_waves(329,:),'red','linewidth',2); hold on
%      plot((y(329,:))/1000,DEWIT_wave_dir_mud_wind_waves(329,:),'blue','linewidth',2); hold on
              plot((y(329,:))/1000,GADE_wave_dir_mud_wind_waves(329,:),'cyan','linewidth',1); hold on
                   plot((y(329,:))/1000,NOMUD_wave_dir_mud_wind_waves(329,:),'black','linewidth',0.5); 
  grid on;  grid minor;   xlim([643 690]); ylim([0 80]);  % xlim([537.8 822.8]);   
legend('DELFT','Gade','No mud case')
title('Peak wave direction')
ylabel('Direction [\circ]');

 subplot(6,1,5); daspect([1 1 1])
         plot((y(329,:))/1000,DELFT_ubot_mud_wind_waves(329,:),'red','linewidth',2); hold on
%      plot((y(329,:))/1000,DEWIT_ubot_mud_wind_waves(329,:),'blue','linewidth',2); hold on
              plot((y(329,:))/1000,GADE_ubot_mud_wind_waves(329,:),'cyan','linewidth',1); hold on
                   plot((y(329,:))/1000,NOMUD_ubot_mud_wind_waves(329,:),'black','linewidth',0.5); 
  grid on;  grid minor;  xlim([643 690]);  %ylim([0 1e-3]);   xlim([537.8 822.8]);   
legend('DELFT','Gade','No mud case')
title('Orbital velocity')
ylabel('Velocity [m/s]');
  saveas(gcf,'wind_waves_hsig_dissip_period_dir_ubot_crosshore2016.png')

%% reduction rate

hsig_low = DELFT_hsig_mud_wind_waves(570,1:502); 
  hsig_large =   hsig_mud_wind_wavesDELFT_largervi.hsig_mud_wind_waves(570,1:502);
     
     
    diff_hsig = (hsig_large - hsig_low )./ (hsig_low ) *100;  
    
    diff_hsig = hsig_large./ (hsig_low );  
figure;
plot((y(570,1:502))/1000,diff_hsig);
 xlim([662 720]);

 %%
     %size of my grid cell
    DX=400
    DY=150
    
     %initial points
    x1=482900; y1=644100;
    
    %coordinates for which I am looking the indices
  lon=614100;       lat=664000;
    
    %indices I am looking for
    i_x = round((lon-x1+DX)/DX) %crosshore
    i_y = round((lat-y1+DY)/DY) %alongshore

x(i_x,i_y)
y(i_x,i_y)

%SEARCH COORDINATES

in_x = 200;
 
lon_ = in_x*DX-x1-DX         
lat_ = in_y*DY-x1-DY        


%%
  B=min(DELFT_hsig_mud_wind_waves,[],2);
c=max(DELFT_hsig_mud_wind_waves,[],2);
diff_delftwind_waves= mean((c-B)./c); %0.597695662594465
[x_del,y_del] = gradient(DELFT_hsig_mud_wind_waves); grad_del=(mean(x_del)); grad_del=nanmean(grad_del);

B_g=min(GADE_hsig_mud_wind_waves,[],2);
c_g=max(GADE_hsig_mud_wind_waves,[],2);
diff_gwind_waves= mean((c_g-B_g)./c_g); %0.957596006193814
[x_g,y_g] = gradient(GADE_hsig_mud_wind_waves); grad_g=(mean(x_g)); grad_g=nanmean(grad_g);


B_nm=min(NOMUD_hsig_mud_wind_waves,[],2);
c_nm=max(NOMUD_hsig_mud_wind_waves,[],2); 
diff_nmwind_waves= mean((c_nm-B_nm)./c_nm); %0.553933068429227
[x_nm,y_nm] = gradient(NOMUD_hsig_mud_wind_waves); grad_nm=(mean(x_nm)); grad_nm=nanmean(grad_nm);
%%
  diff_d_crosswind_waves= ( max(DELFT_hsig_mud_wind_waves(292,:))-min(DELFT_hsig_mud_wind_waves(292,:)) )/ max(DELFT_hsig_mud_wind_waves(292,:)) %0.685617214043035
  diff_g_crosswind_waves =  ( max(GADE_hsig_mud_wind_waves(292,:))-min(GADE_hsig_mud_wind_waves(292,:)) )/ max(GADE_hsig_mud_wind_waves(292,:)) %0.998806044092148
  diff_nm_crosswind_waves =  ( max(NOMUD_hsig_mud_wind_waves(292,:))- min(NOMUD_hsig_mud_wind_waves(292,:)) )/ max(NOMUD_hsig_mud_wind_waves(292,:)) %0.549070422535211
  
  grad_d = nanmean(gradient(DELFT_hsig_mud_wind_waves(292,:)))
    grad_g = nanmean(gradient(GADE_hsig_mud_wind_waves(292,:)))
  grad_nm = nanmean(gradient(NOMUD_hsig_mud_wind_waves(292,:)))

  
