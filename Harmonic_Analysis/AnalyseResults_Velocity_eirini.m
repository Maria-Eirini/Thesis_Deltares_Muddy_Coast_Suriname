clear all



WorkDir='d:\PostdocPos\SupervisionsStudents\MariaMudSurinameProject\MatlabScripts\';    %WorkDir='d:/Test';       %Put here working directory
Exp='coarse_grid_maning001\';                                    %Name of experiment
TrimFile='trim-maning001.dat';                      %Name of trim dat file
MatFile='m2m4.mat';                          %Name of mat file to save results from Harmonic analysis
Lat=3.9;                                    %Latitude study area (in degrees)
% day=24*3600;
% year=365*day;
% Tidalperiod=44700/day;%M2
% Tidalperiod_K1=23.93*3600; %Period K1


%Read trim file data
D3DFile_trim = fullfile(WorkDir,TrimFile);
trim=vs_use(D3DFile_trim);
T_his    = vs_time(trim);
time_his=T_his.datenum;
day=24*3600;
Tidalperiod=44700/day;
%    
Option='HarmonicAnalysis';
time=time_his-time_his(1);
clear diff1 diff2 diff3
% diff1=abs(time-5);
% diff2=abs(time-10);
diff2=abs(time-2*Tidalperiod);
% diff3=;
t1=find(diff2==min(diff2));
t2=length(time);


disp(['Reading Velocities from Exp = ',Exp,'...Please wait...'])
[success,Vel] = qp_getdata(trim,'depth averaged velocity','griddata',0,0,0);
X=Vel.X;
Y=Vel.Y;
[N,M]=size(X);


switch Option
    case 'HarmonicAnalysis'
dispstat('','init'); % One time only initialization
dispstat(sprintf('Compute orbital motion characteristics...Please wait...'),'keepthis');

 %%      
jj=1;   
%clear Vel_M2     
  for n=1:N
    for m=1:M

        dispstat(sprintf('%s\n%%',num2str(jj/(N*M)*100)));
        
        Vcomplex= Vel.XComp(:,n,m)+sqrt(-1)*Vel.YComp(:,n,m) ; %v=U+sqrt(-1)*V
        [M0,M2,M4,M6,S2,K1]=HarmonicDecomposition_V5(Vcomplex,time_his,t1,t2,'u_tide',3.9,0);
        Vel_M0(n,m)=M0; 
        Vel_M2.Lsmaj(n,m)=M2.Lsmaj;
        Vel_M2.Lsmin(n,m)=M2.Lsmin;
        Vel_M2.phi(n,m)=M2.g;
        Vel_M2.theta(n,m)=M2.theta;
        Vel_M4.Lsmaj(n,m)=M4.Lsmaj;
        Vel_M4.Lsmin(n,m)=M4.Lsmin;
        Vel_M4.phi(n,m)=M4.g;
        Vel_M4.theta(n,m)=M4.theta;
        Vel_K1.Lsmaj(n,m)=K1.Lsmaj;
        Vel_K1.Lsmin(n,m)=K1.Lsmin;
        Vel_K1.phi(n,m)=K1.g;
        Vel_K1.theta(n,m)=K1.theta;

%         coef=ut_solv(time_his(t1:t2), Vcomplex,[],52,{'M2','M4','M6','S2','K1'},'NodsatNone','OLS','White','LinCI','RunTimeDisp','nnn');
%         longaxis(n,m)=coef.Lsmaj;
%         shortaxis(n,m)=coef.Lsmin;
%         orientation(n,m)=coef.theta;
%         phase(n,m)=coef.g;     
        jj=jj+1; 
       
    end
    
  end
  %%
       disp('Saving to matfile please wait...') 
   save(fullfile(WorkDir,MatFile),'X','Y','Vel_M0','Vel_M2','Vel_M4','Vel_M6','Vel_S2','Vel_K1','Vel');     
    disp('Data saved successfully!!')
end