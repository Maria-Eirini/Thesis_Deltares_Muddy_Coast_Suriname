clear all
close all

%%
TAB1=load('DELFT_MUD_FORCEDWAVES_WIND_2016.mat'); 
TAB1 = TAB1.TAB1(:,:);

TAB2=load('DELFT_MUD_WIND_WAVES_2016.mat'); 
TAB2 = TAB2.TAB2(:,:);

% TAB3=load('DEWIT_MUD_FORCEDWAVES_WIND_2016.mat'); 
% TAB3 = TAB3.TAB3(:,:); 
% TAB4=load('DEWIT_MUD_WIND_WAVES_2016.mat'); 
% TAB4 = TAB4.TAB4(:,:);

TAB5=load('GADE_MUD_FORCEDWAVES_WIND_2016.mat'); 
TAB5 = TAB5.TAB5(:,:);

TAB6=load('GADE_MUD_WIND_WAVES_2016.mat'); 
TAB6 = TAB6.TAB6(:,:);

TAB7=load('NOMUD_FORCEDWAVES_WIND_2016.mat'); 
TAB7 = TAB7.TAB7(:,:);

TAB8=load('NOMUD_WIND_WAVES_2016.mat'); 
TAB8 = TAB8.TAB8(:,:);

%%

x = reshape(TAB1(:,1),592 ,718);
y = reshape(TAB1(:,2),592 ,718);
depth = reshape(TAB1(:,3),592 ,718);
mudl_mud = reshape(TAB1(:,5),592 ,718);

%% 
DELFT_hsig_mud_wind = reshape(TAB1(:,4), 592 ,718 );
DELFT_dissip_total_mud_wind = reshape(TAB1(:,6),592 ,718);
DELFT_dissip_mud_wind = reshape(TAB1(:,7),592 ,718);
DELFT_dissip_wcap_mud_wind  = reshape(TAB1(:,8),592 ,718);
DELFT_dissip_surf_mud_wind  = reshape(TAB1(:,9),592 ,718);
DELFT_wave_dir_mud_wind = reshape(TAB1(:,10),592 ,718);
DELFT_wave_peakdir_mud_wind = reshape(TAB1(:,11),592 ,718);
DELFT_ubot_mud_wind  = reshape(TAB1(:,12),592 ,718);
DELFT_tm01_mud_wind  = reshape(TAB1(:,15),592 ,718);
DELFT_fspr_mud_wind  = reshape(TAB1(:,14),592 ,718);
DELFT_wind_mud_wind  = reshape(TAB1(:,16),592 ,718);


DELFT_hsig_mud_wind_waves = reshape(TAB2(:,4), 592 ,718 );
DELFT_dissip_total_mud_wind_waves = reshape(TAB2(:,6),592 ,718);
DELFT_dissip_mud_wind_waves = reshape(TAB2(:,7),592 ,718);
DELFT_dissip_wcap_mud_wind_waves  = reshape(TAB2(:,8),592 ,718);
DELFT_dissip_surf_mud_wind_waves  = reshape(TAB2(:,9),592 ,718);
DELFT_wave_dir_mud_wind_waves = reshape(TAB2(:,10),592 ,718);
DELFT_wave_peakdir_mud_wind_waves = reshape(TAB2(:,11),592 ,718);
DELFT_ubot_mud_wind_waves  = reshape(TAB2(:,12),592 ,718);
DELFT_tm01_mud_wind_waves  = reshape(TAB2(:,15),592 ,718);
DELFT_fspr_mud_wind_waves  = reshape(TAB2(:,14),592 ,718);
DELFT_wind_mud_wind_waves  = reshape(TAB2(:,16),592 ,718);

%%

% DEWIT_hsig_mud_wind = reshape(TAB3(:,4), 592 ,718 );
% DEWIT_dissip_total_mud_wind = reshape(TAB3(:,6),592 ,718);
% DEWIT_dissip_mud_wind = reshape(TAB3(:,7),592 ,718);
% DEWIT_dissip_wcap_mud_wind  = reshape(TAB3(:,8),592 ,718);
% DEWIT_dissip_surf_mud_wind  = reshape(TAB3(:,9),592 ,718);
% DEWIT_wave_dir_mud_wind = reshape(TAB3(:,10),592 ,718);
% DEWIT_wave_peakdir_mud_wind = reshape(TAB3(:,11),592 ,718);
% DEWIT_ubot_mud_wind  = reshape(TAB3(:,12),592 ,718);
% DEWIT_tm01_mud_wind  = reshape(TAB3(:,15),592 ,718);
% DEWIT_fspr_mud_wind  = reshape(TAB3(:,14),592 ,718);
% DEWIT_wind_mud_wind  = reshape(TAB3(:,16),592 ,718);
% 
% 
% DEWIT_hsig_mud_wind_waves = reshape(TAB4(:,4), 592 ,718 );
% DEWIT_dissip_total_mud_wind_waves = reshape(TAB4(:,6),592 ,718);
% DEWIT_dissip_mud_wind_waves = reshape(TAB4(:,7),592 ,718);
% DEWIT_dissip_wcap_mud_wind_waves  = reshape(TAB4(:,8),592 ,718);
% DEWIT_dissip_surf_mud_wind_waves  = reshape(TAB4(:,9),592 ,718);
% DEWIT_wave_dir_mud_wind_waves = reshape(TAB4(:,10),592 ,718);
% DEWIT_wave_peakdir_mud_wind_waves = reshape(TAB4(:,11),592 ,718);
% DEWIT_ubot_mud_wind_waves  = reshape(TAB4(:,12),592 ,718);
% DEWIT_tm01_mud_wind_waves  = reshape(TAB4(:,15),592 ,718);
% DEWIT_fspr_mud_wind_waves  = reshape(TAB4(:,14),592 ,718);
% DEWIT_wind_mud_wind_waves  = reshape(TAB4(:,16),592 ,718);
% 

%%
GADE_hsig_mud_wind = reshape(TAB5(:,4), 592 ,718 );
GADE_dissip_total_mud_wind = reshape(TAB5(:,6),592 ,718);
GADE_dissip_mud_wind = reshape(TAB5(:,7),592 ,718);
GADE_dissip_wcap_mud_wind  = reshape(TAB5(:,8),592 ,718);
GADE_dissip_surf_mud_wind  = reshape(TAB5(:,9),592 ,718);
GADE_wave_dir_mud_wind = reshape(TAB5(:,10),592 ,718);
GADE_wave_peakdir_mud_wind = reshape(TAB5(:,11),592 ,718);
GADE_ubot_mud_wind  = reshape(TAB5(:,12),592 ,718);
GADE_tm01_mud_wind  = reshape(TAB5(:,15),592 ,718);
GADE_fspr_mud_wind  = reshape(TAB5(:,14),592 ,718);
GADE_wind_mud_wind  = reshape(TAB5(:,16),592 ,718);


GADE_hsig_mud_wind_waves = reshape(TAB6(:,4), 592 ,718 );
GADE_dissip_total_mud_wind_waves = reshape(TAB6(:,6),592 ,718);
GADE_dissip_mud_wind_waves = reshape(TAB6(:,7),592 ,718);
GADE_dissip_wcap_mud_wind_waves  = reshape(TAB6(:,8),592 ,718);
GADE_dissip_surf_mud_wind_waves  = reshape(TAB6(:,9),592 ,718);
GADE_wave_dir_mud_wind_waves = reshape(TAB6(:,10),592 ,718);
GADE_wave_peakdir_mud_wind_waves = reshape(TAB6(:,11),592 ,718);
GADE_ubot_mud_wind_waves  = reshape(TAB6(:,12),592 ,718);
GADE_tm01_mud_wind_waves  = reshape(TAB6(:,15),592 ,718);
GADE_fspr_mud_wind_waves  = reshape(TAB6(:,14),592 ,718);
GADE_wind_mud_wind_waves  = reshape(TAB6(:,16),592 ,718);


%%
NOMUD_hsig_mud_wind = reshape(TAB7(:,4), 592 ,718 );
NOMUD_dissip_total_mud_wind = reshape(TAB7(:,6),592 ,718);
NOMUD_dissip_mud_wind = reshape(TAB7(:,7),592 ,718);
NOMUD_dissip_wcap_mud_wind  = reshape(TAB7(:,8),592 ,718);
NOMUD_dissip_surf_mud_wind  = reshape(TAB7(:,9),592 ,718);
NOMUD_wave_dir_mud_wind = reshape(TAB7(:,10),592 ,718);
NOMUD_wave_peakdir_mud_wind = reshape(TAB7(:,11),592 ,718);
NOMUD_ubot_mud_wind  = reshape(TAB7(:,12),592 ,718);
NOMUD_tm01_mud_wind  = reshape(TAB7(:,15),592 ,718);
NOMUD_fspr_mud_wind  = reshape(TAB7(:,14),592 ,718);
NOMUD_wind_mud_wind  = reshape(TAB7(:,16),592 ,718);


NOMUD_hsig_mud_wind_waves = reshape(TAB8(:,4), 592 ,718 );
NOMUD_dissip_total_mud_wind_waves = reshape(TAB8(:,6),592 ,718);
NOMUD_dissip_mud_wind_waves = reshape(TAB8(:,7),592 ,718);
NOMUD_dissip_wcap_mud_wind_waves  = reshape(TAB8(:,8),592 ,718);
NOMUD_dissip_surf_mud_wind_waves  = reshape(TAB8(:,9),592 ,718);
NOMUD_wave_dir_mud_wind_waves = reshape(TAB8(:,10),592 ,718);
NOMUD_wave_peakdir_mud_wind_waves = reshape(TAB8(:,11),592 ,718);
NOMUD_ubot_mud_wind_waves  = reshape(TAB8(:,12),592 ,718);
NOMUD_tm01_mud_wind_waves  = reshape(TAB8(:,15),592 ,718);
NOMUD_fspr_mud_wind_waves  = reshape(TAB8(:,14),592 ,718);
NOMUD_wind_mud_wind_waves  = reshape(TAB8(:,16),592 ,718);


