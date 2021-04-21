%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%Template for running and plotting simulations%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
The purpose of this template is to make the simulation and
plotting process as efficient as possible. This m-file will 
serve as a central console where all the necessary changes
can be made all at once and have these changes reflected in
the various simulations. 

So if used appropriately, you will only need one m-file for
the entire lab, since you can keep duplicating the template
for every simulation. However, it would not be efficient to
have only one simulink model for the different simulations.
Hence, create seperate simulink models for each exercise &
you can selectively execute those simulations from this 
single m-file. 
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Simulation time: This is the amount of time that 
% the simulation is performed. Suitably decide the amount
% of time necessary to clearly observe the entire response.
% For instance, for first order systems, make the simulation
% to be about 5 times the time constant of the system, etc.

clc;
clear all;
close all;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Start time: This is the time when the step input is applied. 
% It is usually set either at a particular required time, 
% when we want the step input to start, OR by default it has
% a value of 1 second so that when the step response is 
% plotted, we have a clearly visible start point at 1 second.

tstart = 1; % start time for the step input 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parametric values: This is where you will enter all the 
% values of the different parameters in the several blocks of
% the simulink models. This way, if any parameter is located 
% at several places in a simulink file, you will only need to 
% change its value at this one location. 

V = 0.2;
Kq = 0.6;
qOver2h = 0.08; % gpm/in

Ktop = 17.533;
Kbot = 14.844;
Kp = 0.18164;
Ki = 0.001253;
T = 100; % Time constant

tsim = 800; % simulation time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Running the simulation:MatLab offers the option of running
% the simulation by invoking the simulink file, so that you 
% do not have to seperately click the 'run' button in the 
% simulink file itself. You can do this by using the command 
% below:

sim('twotank_RLoc');

%'ex1_model' is the name that you will need to give to the
% simulink file. This file name should be unique to each 
% simulink file. In other words, no two files, be it simulink
% model or m-file, should share the same name. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plotting the results: MatLab offers extensive options for 
% formatting the simulation plots, so as to make them look
% good. Although these settings could be made within the 
% m-file, I will be using the figure editor to make these 
% formatting settings. 


% The link below provide extensive help for formatting the
% plots from within the m-file. You can use this if you 
% choose to not use the figure editor.
% (https://www.mathworks.com/help/matlab/ref/plot.html)  

% You will notice that the 'the two workspace' block of 
% simulink downloads the simulation data to the workspace of
% MatLab, and hence this data is readily available for 
% plotting. However, in the later labs, you will be saving 
% data as a .mat file, and in those cases, you will first 
% need to load the data into the workspace. You can do this
% by using the following command:   
% load filename.mat

figure(1);

plot(tout,height_bottom);

grid on;
title ('Step Response from Steady State for Bottom Tank'); % You must have graph title
xlabel ('Time [sec]'); % and axis labels
ylabel ('Height Change [in.]');
xlim([0 700]);

figure(2);
plot(tout,height_top);
grid on;
title ('Step Response from Steady State for Top Tank'); % You must have graph title
xlabel ('Time [sec]'); % and axis labels
ylabel ('Height Change [in.]');
xlim([0 700]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
