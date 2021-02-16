clear all

%%
WorkDir='c:\Documents_C\Tests_Eirini_FLOW\nestingSuriname2008_C\';    %WorkDir='d:/Test';       %Put here working directory
Exp='detailed_nomud\';                                    %Name of experiment
TrimFile='trim-detailed_nomud.dat';                      %Name of trim dat file
MatFile='m2m4.mat';                          %Name of mat file to save results from Harmonic analysis
Lat=3.9;                                    %Latitude study area (in degrees)
%%____________________________


day=24*3600;
Tidalperiod=44700/day;%M2 tidal period

%Read trim file data
D3DFile_trim = fullfile(WorkDir,Exp,TrimFile);
trim=vs_use(D3DFile_trim);
T_his    = vs_time(trim);
time_his=T_his.datenum;

day=24*3600;
Tidalperiod=44700/day;


fonts=20;

Option='HarmonicAnalysis';%'HarmonicAnalysis'/'WaterLevelAnalysis'
MatFile='WL_analysis.mat'; 


%     
time=time_his-time_his(1);
clear diff1 diff2 diff3
% diff1=abs(time-5);
% diff2=abs(time-10);
diff2=abs(time-2*Tidalperiod);
% diff3=;
t1=find(diff2==min(diff2));

% t1=find(diff1==min(diff1));
t2=length(time);

% [success,depth] = qp_getdata(trim,'initial bed level','griddata',0,0);
% depth=depth.Val;
% save(fullfile(WorkDir,'WaterDepth.mat'),'depth');

%% ___

disp(['Reading Water Level from Exp = ',Exp,'...Please wait...'])
[success,WL] = qp_getdata(trim,'water level','griddata',0,0,0);
X=WL.X;
Y=WL.Y;


[N,M]=size(X);

switch Option
    case 'HarmonicAnalysis'

dispstat('','init'); % One time only initialization
        dispstat(sprintf('Performing harmonic analysis...Please wait...'),'keepthis');
        
        
jj=1;
clear WL_M2
for n=1:N
    for m=1:M
        dispstat(sprintf('Progress %s%%',num2str(jj/(N*M)*100)));
        
                [M0,M2,M4,M6,S2,K1]=HarmonicDecomposition_V4(WL.Val(:,n,m),time_his,t1,t2,'u_tide',52);
                WL_M0(n,m)=M0;
                WL_M2.A(n,m)=M2.A;
                WL_M2.phi(n,m)=M2.phi;
                WL_M4.A(n,m)=M4.A;
                WL_M4.phi(n,m)=M4.phi;
%                 WL_M6.A(n,m)=M6.A;
%                 WL_M6.phi(n,m)=M6.phi;
%                 WL_S2.A(n,m)=S2.A;
%                 WL_S2.phi(n,m)=S2.phi;
%                 WL_K1.A(n,m)=K1.A;
%                 WL_K1.phi(n,m)=K1.phi;
% %                 WL_O1.A(n,m)=O1.A;
% %                 WL_O1.phi(n,m)=O1.phi;
                
        jj=jj+1;
        
    end
end

% delete(hwaitbar)
    disp('Saving to matfile please wait...')
        save(fullfile(WorkDir,MatFile),'X','Y','WL_M0','WL_M2','WL_M4','WL');
disp('Data saved successfully!!')
%%

%     case 'WaterLevelAnalysis'
%   %%
%         dispstat('','init'); % One time only initialization
%         dispstat(sprintf('Compute water level characteristics...Please wait...'),'keepthis');
%       clear Zeta
%       jj=1;
%   for n=1:N
%     for m=1:M
%         clear wl
%         dispstat(sprintf('Progress %s%%',num2str(jj/(N*M)*100)));
%         wl=squeeze(WL.Val(t1:t2,n,m));
%         Zeta.min(n,m)=min(wl(:));
%         Zeta.max(n,m)=max(wl(:));
%      
%         jj=jj+1; 
%     end
%     
%   end
%        disp('Saving to matfile please wait...') 
%    save(fullfile(WorkDir,['Delft3DZunoWLmaxmin_',Exp,'.mat']),'X','Y','Zeta');     
%     disp('Data saved successfully!!')
% 
% 
end