close all
clear all
%%

load('WL_analysis.mat');
x=load('x.mat');
y=load('y.mat');
depth = load('water_depth');

%%
K1 = WL_K1.A;
S2 = WL_S2.A;
M2 = WL_M2.A;
M4 = WL_M4.A;
depth=depth.depth;


%%
figure;

subplot(4,1,1)
pcolor(X/1000,Y/1000,(M2)); shading interp; colorbar; colormap(jet);
 cb = colorbar();   lim=caxis; %caxis([0 0.5]);  
   title('M2 amplitude [m]'); daspect([1 1 1]);
    ylabel(['Crossshore Distance [km]']); xlabel('Alongshore Distance [km]');
subplot(4,1,2)
pcolor(X/1000,Y/1000,M4); shading interp; colorbar; colormap(jet);
 cb = colorbar();   lim=caxis; caxis([0 0.37]);  
   title('M4 Amplitude [m]');daspect([1 1 1]);
    ylabel('Crossshore Distance [km]'); xlabel('Alongshore Distance [km]');
subplot(4,1,3)
pcolor(X/1000,Y/1000,S2); shading interp; colorbar; colormap(parula);
 cb = colorbar();   lim=caxis;caxis([0 0.37]);    
   title('S2 Amplitude [m]');daspect([1 1 1]);
    ylabel('Crossshore Distance [km]'); xlabel('Alongshore Distance [km]');
subplot(4,1,4)
pcolor(X/1000,Y/1000,K1); shading interp; colorbar; colormap(parula);
 cb = colorbar();   lim=caxis;caxis([0 0.37]);   
   title('K1 Amplitude [m]');daspect([1 1 1]);
    ylabel('Crossshore Distance [km]'); xlabel('Alongshore Distance [km]');


