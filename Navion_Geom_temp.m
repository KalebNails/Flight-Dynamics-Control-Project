clear all
clc

%Trim Velocity components
initu = 223;
initv = 0;
initw = 0;

%Initial rates
initp=0;
initq=0;
initr=0;

%Initial attitude
initbank = 0;
initpitch=initw/initu;
inithead=0;

%Initial Position
initnorth=0;
initeast=0;
initalt=5000;

% NAVION stability derivatives

% CL
cla=4.44;
cladot=0;
clq=3.8;
clde=0.355;
clo=0.41;

% CD
cda2=0.33;
cdo=0.05;

% CM
cma=-0.683;
cmde=-0.923;
cmadot=-4.36;
cmq=-9.96;

%CY
cyb = -0.564;
cydr = 0.157;

%CL - Roll
clb = -0.074;
clp = -0.410;
clr = 0.107;
clda = -0.134;
cldr = 0.107;

%CN
cnb = 0.071;% needs to be positive
cnp = -0.0575;
cnr = -0.125;
cnda = -0.0035;
cndr = -0.072;

sw=184;
b=33.4;
cbar = 5.7;
weight = 2750;

cg=[0 0 0];

ac=[0 0 0];

eng=[0 0 0];

jx= 1048;
jy=3000;
jz =3500;
jxz=0;

% Controls

elevator = 1.11*3.141/180; % Negative nose up 
aileron = 0;
rudder = 0;
throtle = 1;

control = [elevator, aileron, rudder, throtle];

