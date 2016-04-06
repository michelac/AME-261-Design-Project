%function for Temperature, Density, and Viscosity as a function of altitude
function [Temperature, Density, Viscosity]=atmosphere(h) ; 
R=287;       %given constant
g=9.81;      %given gravity [m/s^2]

if (0<=h) && (h<11000) %for altitudes bleow 0<=11,000 m
    a=-0.0065;
    T1=288.16; %given initial temperature [K]
    p1=1.225;  %given initial density [kg/m^3]
    Temperature=T1+a*(h);%[K]
    Density=p1*((Temperature/T1)^(-1*((g/(a*R))+1)));   %[kg/m^3]
    Viscosity=1.54*(1+0.0039*(Temperature-250))*10^(-5);%[kg(m*sec)]
    
    
elseif  h>=11000 %for altitudes above 11,000 m
    Temperature=216.66; 
    p1=.36480;
    Density=p1*exp(-g*(h-11000)/(R*Temperature));
    Viscosity=1.54*(1+0.0039*(Temperature-250))*10^(-5);%[kg(m*sec)]
end

        