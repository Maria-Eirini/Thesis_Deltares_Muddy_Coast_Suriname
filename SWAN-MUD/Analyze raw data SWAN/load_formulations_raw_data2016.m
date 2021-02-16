close all
clear all

%% DELFT

mud_wind_dir='C:\Documents_C\SWAN_standalone\suriname2016\DELFT\suriname2016_mud_wind_triangular_delft';
TAB1=load(fullfile(mud_wind_dir,'SWANOUT1'));

windwaves_dir = 'D:\backup_deltares_laptop\Documents_C\SWAN_standalone\suriname2016\DELFT\suriname2016_mud_wind_waves_triangular_delft';
TAB2=load(fullfile(windwaves_dir,'SWANOUT1'));

TAB1(TAB1==-999) = NaN; TAB1(TAB1==-99) = NaN; TAB1(TAB1==-9) = NaN;
TAB2(TAB2==-999) = NaN;  TAB2(TAB2==-99) = NaN;  TAB2(TAB2==-9) = NaN;

save('DELFT_MUD_FORCEDWAVES_WIND_2016.mat','TAB1'); 
save('DELFT_MUD_WIND_WAVES_2016.mat','TAB2');

%% DEWIT

% mud_wind_dir='C:\Documents_C\SWAN_standalone\suriname2016\suriname2016_mud_wind_triangular_dewit';
% TAB3=load(fullfile(mud_wind_dir,'SWANOUT1'));
% 
% windwaves_dir = 'C:\Documents_C\SWAN_standalone\suriname2016\suriname2016_mud_wind_waves_triangular_dewit';
% TAB4=load(fullfile(windwaves_dir,'SWANOUT1'));
% 
% TAB3(TAB3==-999) = NaN; TAB3(TAB3==-99) = NaN; TAB3(TAB3==-9) = NaN;
% TAB4(TAB4==-999) = NaN;  TAB4(TAB4==-99) = NaN;  TAB4(TAB4==-9) = NaN;
% 
% save('DEWIT_MUD_FORCEDWAVES_WIND_2016.mat','TAB3'); 
% save('DEWIT_MUD_WIND_WAVES_2016.mat','TAB4');



%% GADE

mud_wind_dir='C:\Documents_C\SWAN_standalone\suriname2016\GADE\suriname2016_mud_wind_triangular_gade';
TAB5=load(fullfile(mud_wind_dir,'SWANOUT1'));

windwaves_dir = 'C:\Documents_C\SWAN_standalone\suriname2016\GADE\suriname2016_mud_wind_waves_triangular_gade';
TAB6=load(fullfile(windwaves_dir,'SWANOUT1'));

TAB5(TAB5==-999) = NaN; TAB5(TAB5==-99) = NaN; TAB5(TAB5==-9) = NaN;
TAB6(TAB6==-999) = NaN;  TAB6(TAB6==-99) = NaN;  TAB6(TAB6==-9) = NaN;

save('GADE_MUD_FORCEDWAVES_WIND_2016.mat','TAB5'); 
save('GADE_MUD_WIND_WAVES_2016.mat','TAB6');



%% NOMUD

nomud_wind_dir = 'c:\Documents_C\SWAN_standalone\suriname2016\suriname_nomud_wind\';
TAB7=load(fullfile(nomud_wind_dir,'SWANOUT1'));

nomud_windwaves_dir = 'c:\Documents_C\SWAN_standalone\suriname2016\suriname_nomud_wind_waves\';
TAB8=load(fullfile(nomud_windwaves_dir,'SWANOUT1'));

TAB7(TAB7==-999) = NaN; TAB7(TAB7==-99) = NaN; TAB7(TAB7==-9) = NaN;
TAB8(TAB8==-999) = NaN;  TAB8(TAB8==-99) = NaN;  TAB8(TAB8==-9) = NaN;

save('NOMUD_FORCEDWAVES_WIND_2016.mat','TAB7'); 
save('NOMUD_WIND_WAVES_2016.mat','TAB8');

