clear all
close all

%%


loc1 = load('loc1.txt');
loc2 = load('loc2.txt');
loc3 = load('loc3.txt');


%%

nomud_loc1 = loc1(:,2);
delft_loc1 = loc1(:,3);
gade_loc1 = loc1(:,4);
freqloc1 = loc1(:,1);


nomud_loc2 = loc2(:,2);
delft_loc2 = loc2(:,3);
gade_loc2 = loc2(:,4);
freqloc2 = loc2(:,1);

nomud_loc3 = loc3(:,2);
delft_loc3 = loc3(:,3);
gade_loc3 = loc3(:,4);
freqloc3 = loc3(:,1);


%%
figure; 
subplot(3,1,1)
plot(freqloc3,delft_loc3,'red','linewidth',2); hold on;plot(freqloc3,gade_loc3,'cyan','linewidth',2);
hold on; plot(freqloc3,nomud_loc3,'black','linewidth',1);grid on;
legend( 'DELFT', 'Gade', 'No mud case'); title('Offshore'); xlim([0 0.7])
xlabel('Frequency [cycles/second]'); ylabel('Energy [m^2/Hz] ')

subplot(3,1,2)
 plot(freqloc2,delft_loc2,'red','linewidth',2); 
 hold on; plot(freqloc2,gade_loc2,'cyan','linewidth',2); hold on; 
 plot(freqloc2,nomud_loc2,'black','linewidth',1); xlim([0 0.7])
legend( 'DELFT', 'Gade', 'No mud case'); title('Starting point mudbanks');grid on;
xlabel('Frequency [cycles/second]'); ylabel('Energy [m^2/Hz] ')

subplot(3,1,3)
 xlabel('Frequency [cycles/second]'); ylabel('Energy [m^2/Hz] ')
 plot(freqloc1,delft_loc1,'red','linewidth',2); hold on; plot(freqloc1,gade_loc1,'cyan','linewidth',2); 
 hold on; plot(freqloc1,nomud_loc1,'black','linewidth',1);xlim([0 0.7]); ylim([0 0.07])
legend( 'DELFT', 'Gade', 'No mud case'); title('Onshore'); grid on;
xlabel('Frequency [cycles/second]'); ylabel('Energy [m^2/Hz] ')
%%

% figure; %loc2
% plot(freq,nomud_loc2); hold on; plot(freq,delft_loc2); hold on;
% plot(freq,dewit_loc2); hold on; plot(freq,gade_loc2); hold on;
% legend('No mud case', 'DELFT', 'De Wit', 'Gade')
% 
% 
% figure; %loc2
% plot(freq,nomud_loc2); hold on; plot(freq,delft_loc2); hold on;
% plot(freq,dewit_loc2); hold on; plot(freq,gade_loc2); hold on;
% legend('No mud case', 'DELFT', 'De Wit', 'Gade')


%%
% loc4 = load('loc4.txt');
% loc5 = load('loc5.txt');
% loc6 = load('loc6.txt');
% 
% nomud_loc4 = loc4(:,1);
% delft_loc4 = loc4(:,2);
% dewit_loc4 = loc4(:,3);
% gade_loc4=   loc4(:,4);
% 
% nomud_loc5 = loc5(:,1);
% delft_loc5 = loc5(:,2);
% dewit_loc5 = loc5(:,3);
% gade_loc5 = loc5(:,4);
%  
% nomud_loc6 = loc6(:,1);
% delft_loc6 = loc6(:,2);
% dewit_loc6 = loc6(:,3);
% gade_loc6 = loc6(:,4);
% 

