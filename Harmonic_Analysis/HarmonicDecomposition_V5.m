function [M0,M2,M4,M6,S2,K1]=HarmonicDecomposition_V5(Xin,timevec,t1,t2,method,LAT,tf);
%%Function to retrieve Amp/Phase of M0, M2, M4, M6 and S2 and K1 from vector Xin (e.g. M2.A=amp and M2.phi is phase in degrees)
%%Xin=Vector (can be scalar, or complex in the case of velocity (=U+sqrt(-1)*V)
%%timevec=time (in days)
%%t1/t2: start/end time indices
%%method='t_tide'/'u_tide'; (Default='u_tide'); %Better use u_tide
%%LAT=latitude
%%tf=1/0; %tf=1: Real (use this for Water level), tf=0: COmplex (use this for velocity u+iv)

%%____!!!!!!!!!!!!!!!!!!!Better use u_tide!!!!!!!!!!!!!!!!!!!!!!

% Xin=Vcomplex;
% timevec=time_his;
% method='u_tide';
% LAT=3.9;

TidalComp = {'M2','M4','M6','S2','K1'}; %Adjust this in case of retrieving additional components
% timevec=timevec-timevec(1);
% Time=datenum('01-01-2015')+timevec(t1:t2);
Time=timevec(t1:t2);

% datestr(Time)
M0=nanmean(Xin(t1:t2));


%tf=isreal(Xin);%Check wether array is complex (in case of velocity u+iv)
tf2=isnan(Xin);%check wether array contains nans
tf3=all(Xin==0);%Check whether the array contains 0s.
switch method
    
    
    
    %using 'u_tide'
    case 'u_tide'
        if  max(tf3)==0
            if max(tf2)==0
                %%Retrieve M2, M4 and M6
                clear coef
                if tf==1
                    coef = ut_solv2(timevec(t1:t2),Xin(t1:t2),[],LAT,TidalComp,'NodsatNone','OLS','White','LinCI','RunTimeDisp','nnn');
                elseif tf==0
                    %disp('output')
                    coef = ut_solv2(timevec(t1:t2),real(Xin(t1:t2)),imag(Xin(t1:t2)),LAT,TidalComp,'NodsatNone','OLS','White','LinCI','RunTimeDisp','nnn');
                end
                
                
                indM2 = strmatch(TidalComp{1},coef.name,'exact');
                indM4 = strmatch(TidalComp{2},coef.name,'exact');
                indM6 = strmatch(TidalComp{3},coef.name,'exact');
                indS2 = strmatch(TidalComp{4},coef.name,'exact');
                indK1 = strmatch(TidalComp{5},coef.name,'exact');
                
                if tf==1
                    M2.A=coef.A(indM2);
                    M4.A=coef.A(indM4);
                    M6.A=coef.A(indM6);
                    S2.A=coef.A(indS2);
                    K1.A=coef.A(indK1);
                elseif tf==0
                    
                    M2.Lsmaj=coef.Lsmaj(indM2);
                    M4.Lsmaj=coef.Lsmaj(indM4);
                    M6.Lsmaj=coef.Lsmaj(indM6);
                    S2.Lsmaj=coef.Lsmaj(indS2);
                    K1.Lsmaj=coef.Lsmaj(indK1);
                    
                    M2.Lsmin=coef.Lsmin(indM2);
                    M4.Lsmin=coef.Lsmin(indM4);
                    M6.Lsmin=coef.Lsmin(indM6);
                    S2.Lsmin=coef.Lsmin(indS2);
                    K1.Lsmin=coef.Lsmin(indK1);
                    
                    M2.theta=coef.theta(indM2);
                    M4.theta=coef.theta(indM4);
                    M6.theta=coef.theta(indM6);
                    S2.theta=coef.theta(indS2);
                    K1.theta=coef.theta(indK1);
                    
                    M2.g=coef.g(indM2);
                    M4.g=coef.g(indM4);
                    M6.g=coef.g(indM6);
                    S2.g=coef.g(indS2);
                    K1.g=coef.g(indK1);
                    
                    
                end
                M2.phi=coef.g(indM2);
                M4.phi=coef.g(indM4);
                M6.phi=coef.g(indM6);
                S2.phi=coef.g(indS2);
                K1.phi=coef.g(indK1);
                
                
            elseif max(tf2)==1
                if tf==1
                    M2.A=NaN;
                    M4.A=NaN;
                    M6.A=NaN;
                    S2.A=NaN;
                    K1.A=NaN;
                    
                    M2.phi=NaN;
                    M4.phi=NaN;
                    M6.phi=NaN;
                    S2.phi=NaN;
                    K1.phi=NaN;
                    
                elseif tf==0
                    M2.Lsmaj=NaN;
                    M4.Lsmaj=NaN;
                    M6.Lsmaj=NaN;
                    S2.Lsmaj=NaN;
                    K1.Lsmaj=NaN;
                    
                    M2.Lsmin=NaN;
                    M4.Lsmin=NaN;
                    M6.Lsmin=NaN;
                    S2.Lsmin=NaN;
                    K1.Lsmin=NaN;
                    
                    M2.theta=NaN;
                    M4.theta=NaN;
                    M6.theta=NaN;
                    S2.theta=NaN;
                    K1.theta=NaN;
                    
                    M2.g=NaN;
                    M4.g=NaN;
                    M6.g=NaN;
                    S2.g=NaN;
                    K1.g=NaN;
                    
                end
            end
        elseif max(tf3)==1
             if tf==0
            M2.A=NaN;
            M4.A=NaN;
            M6.A=NaN;
            S2.A=NaN;
            K1.A=NaN;
            
            M2.phi=NaN;
            M4.phi=NaN;
            M6.phi=NaN;
            S2.phi=NaN;
            K1.phi=NaN;
            
            elseif tf==0
                    M2.Lsmaj=NaN;
                    M4.Lsmaj=NaN;
                    M6.Lsmaj=NaN;
                    S2.Lsmaj=NaN;
                    K1.Lsmaj=NaN;
                    
                    M2.Lsmin=NaN;
                    M4.Lsmin=NaN;
                    M6.Lsmin=NaN;
                    S2.Lsmin=NaN;
                    K1.Lsmin=NaN;
                    
                    M2.theta=NaN;
                    M4.theta=NaN;
                    M6.theta=NaN;
                    S2.theta=NaN;
                    K1.theta=NaN;
                    
                    M2.g=NaN;
                    M4.g=NaN;
                    M6.g=NaN;
                    S2.g=NaN;
                    K1.g=NaN;
                
             end
        end
        %%using t_tide
    case 't_tide'
        %%
        if  max(tf3)==0
            if max(tf2)==0
                clear VEC
                [VEC,~] = t_tide(Xin(t1:t2),'interval',diff(timevec(t1:t2)).*24,...
                    'start time',timevec(t1),'latitude',LAT,'error','wboot','output','none','diary','none');
                
                indM2 = strmatch(TidalComp{1},VEC.name,'exact');
                indM4 = strmatch(TidalComp{2},VEC.name,'exact');
                indM6 = strmatch(TidalComp{3},VEC.name,'exact');
                indS2 = strmatch(TidalComp{4},VEC.name,'exact');
                indK1 = strmatch(TidalComp{5},VEC.name,'exact');
                
                
                
                
                M2.A=VEC.tidecon(indM2,1);
                M4.A=VEC.tidecon(indM4,1);
                M6.A=VEC.tidecon(indM6,1);
                S2.A=VEC.tidecon(indS2,1);
                K1.A=VEC.tidecon(indK1,1);
                if tf==1
                    
                    M2.phi=VEC.tidecon(indM2,3);
                    M4.phi=VEC.tidecon(indM4,3);
                    M6.phi=VEC.tidecon(indM6,3);
                    S2.phi=VEC.tidecon(indS2,3);
                    K1.phi=VEC.tidecon(indK1,3);
                elseif tf==0
                    M2.phi=VEC.tidecon(indM2,7);
                    M4.phi=VEC.tidecon(indM4,7);
                    M6.phi=VEC.tidecon(indM6,7);
                    S2.phi=VEC.tidecon(indS2,7);
                    K1.phi=VEC.tidecon(indK1,7);
                end
                
            elseif max(tf2)==1
                M2.A=NaN;
                M4.A=NaN;
                M6.A=NaN;
                S2.A=NaN;
                K1.A=NaN;
                
                M2.phi=NaN;
                M4.phi=NaN;
                M6.phi=NaN;
                S2.phi=NaN;
                K1.phi=NaN;
                
                
            end
        elseif max(tf3)==1
            M2.A=NaN;
            M4.A=NaN;
            M6.A=NaN;
            S2.A=NaN;
            K1.A=NaN;
            
            M2.phi=NaN;
            M4.phi=NaN;
            M6.phi=NaN;
            S2.phi=NaN;
            K1.phi=NaN;
        end
end
