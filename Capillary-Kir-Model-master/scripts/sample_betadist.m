drivingPot = -0.140;
cap = 15;
Ek = -0.014;
Ko = 60; %mM
factor = (1E09)*(1E-12)*(cap/(sqrt(60)*(abs(drivingPot-Ek))));


% mu_deprived = factor*0.16; % min value for dist, could change to a normal (I think I will) 1/3/21 -DPI
% sigma_deprived = factor*5.08;


mu_deprived = factor*7; % min value for dist, could change to a normal (I think I will) 1/3/21 -DPI
sigma_deprived = factor*6;

mu_control = factor*9.8;
sigma_control = factor*8.7;

mu_stim = factor*16.9;
sigma_stim = factor*11;

mu_hub = factor*22;
sigma_hub = factor*10;

%% Beta distribution model for Kir conductance in the deprived cells (moderate negative skew)
alpha_deprived = 3;
beta_deprived = 10;
N = 1e3;
U = rand(N,1);
tic,Z = betaincinv(U,alpha_deprived,beta_deprived);toc
histogram(Z+mu_deprived,100);


%% Beta distribution model for Kir conductance in the control cells (large negative skew)
alpha_control = 3;
beta_control = 10;
N = 1e3;
U = rand(N,1);
tic,Z = betaincinv(U,alpha_control,beta_control);toc
histogram(Z+mu_control,100,'norm','pdf');
hold on



%% (fat) Normal distribution of Kir conductance for Whisker stim cells


%%  distributions, 
%ctrl - skew
% deprived - heavier skew
% VSP - Fat Normal

N = 10000;
alpha = 50;
loc = mu_control; 
scale = sigma_control;
[GKir_control] = rskewn(N,alpha,loc,scale);
histogram(GKir_control/sqrt(3));hold on


alpha = 100;
loc = mu_deprived; 
scale = sigma_deprived;
[GKir_deprived] = rskewn(N,alpha,loc,scale);
histogram(GKir_deprived/sqrt(3));hold on


Gkir_stim = mu_stim + sigma_stim*randn(N,1);
histogram(Gkir_stim/sqrt(3)); hold off;
legend({'control', 'deprived', 'stim'})
ylabel('PDF of Kir values')
xlabel('Gkir')

%%  distributions, 
%ctrl - normal
% deprived - Normal
% VSP - Fat Normal


N = 45;
GKir_control = mu_control + sigma_control*randn(N,1);
histogram(GKir_control);hold on


GKir_deprived = mu_deprived + sigma_deprived*randn(N,1);
histogram(GKir_deprived);hold on


Gkir_stim = mu_stim + sigma_stim*randn(N,1);
histogram((Gkir_stim)); hold off;
legend({'control', 'deprived', 'stim'})
ylabel('PDF of Kir values')
xlabel('Gkir')











