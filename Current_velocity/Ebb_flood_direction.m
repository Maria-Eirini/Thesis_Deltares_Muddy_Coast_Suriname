%% SCRIPT FOR Water level and tidal current direction during ebb and flood

close all
clear all
%%
 %run('D:\backup_deltares_laptop\Documents_C\OpenEarthTools2018\oetsettings.m') % change for your directory
% addpathfast('d:\backup_deltares_laptop\Documents_C\OpenEarthTools2018\') % change for your directory 
% clc;
% 
% disp('Open Earth Tools loaded!')    
%%

%flow
% WorkDir='D:\backup_deltares_laptop\Documents_C\FLOW-WAVE_online_coupling\suriname2016\detailed';
% NameExp='trim_detailed';
D3DFile_flow= ('trim-detailed.dat');
triw = vs_use(D3DFile_flow);
show = vs_disp(triw);

%%
U1=vs_get(triw,'map-series',{0},'U1',{0 0 0},'quiet');
V1=vs_get(triw,'map-series',{0},'V1',{0 0 0},'quiet');
x=vs_get(triw,'map-const',{0},'XZ',{0 0},'quiet');
y=vs_get(triw,'map-const',{0},'YZ',{0 0},'quiet');
WL=vs_get(triw,'map-series',{0},'S1',{0 0});
x(x == 0) = nan;
y(y == 0) = nan;

%%
num1=95;
U1_DATA1 = cell2mat(U1(num1,1));
V1_DATA1 =cell2mat(V1(num1,1));
WL_DATA1 =cell2mat(WL(num1,1));


num2=115;
U1_DATA2 = cell2mat(U1(num2,1));
V1_DATA2 =cell2mat(V1(num2,1));
WL_DATA2 =cell2mat(WL(num2,1));

%%

figure;
sgtitle('Water level and tidal current direction');
subplot(2,1,2)
      pcolor((x)/1000,(y)/1000,WL_DATA1); shading interp; h=colorbar; colormap(parula); hold on;
          quiver(x(1:160:end)/1000,y(1:160:end)/1000,U1_DATA1(1:160:end),V1_DATA1(1:160:end),'AutoScaleFactor',1,'color','black');
     ylim([640 690]); xlim([510 712]);   daspect([1 1 1]);      h=colorbar; colormap(jet);
    title('Ebb ');    xlabel('X  coordinate UTM21N [km]');   
  ylabel('Y coordinate UTM21N [km]'); set(get(h,'title'),'string','WL [m]'); caxis([-1.7 1.7]);

     subplot(2,1,1)
        pcolor((x)/1000,(y)/1000,WL_DATA2); shading interp; h=colorbar; colormap(parula); hold on;
          quiver(x(1:160:end)/1000,y(1:160:end)/1000,U1_DATA2(1:160:end),V1_DATA2(1:160:end),'AutoScaleFactor',1,'color','black');
     ylim([640 690]); xlim([510 712]);   daspect([1 1 1]);h=colorbar; colormap(jet);
    title('Flood');    xlabel('X  coordinate UTM21N [km]');   
  ylabel('Y coordinate UTM21N [km]'); set(get(h,'title'),'string',' WL [m]'); caxis([-1.7 1.7]);





