function [ dz ] = invPend_DynamicsWrapper(t,z,u,params)
%INVPEND_DYNAMICS wrapper to numerically compute 3-link invertered Pendulum's EOMs
% FILENAME: invPend_Dynamics.m
% AUTHOR:   Roberto Shu
% LAST EDIT: 
%
% INPUTS:
%   t:      descritize time vector
%   z:      1st order state vector [10 X n] <--> [q X n;dq X n]
%           n = number of grid/descritazation points
%   u:      control input [2 X n]
%   lambda: constraint forces
%   params: structure variable with model parameters
%
% OUTPUTS:
%   dz: System state derivative    
%

%% ----------------------------------------------------------
%   READ AND INTERPRET INPUTS
% -----------------------------------------------------------
nt = length(t);
p = params;
q = z(1:5,:);
dq = z(6:10,:);

if isempty(u)
    u = zeros(2,nt);
end

%% ----------------------------------------------------------
%   EQUATION OF MOTION
% -----------------------------------------------------------

% allocate memory space
ddq = zeros(size(q));

% Numerically compute EOMs
for i=1:nt
    
    % EOM matrices
    [D,C,G,B] = invPend_3link_EOM_mtxs(q(1,i),q(2,i),q(3,i),q(4,i),q(5,i),...
                        dq(1,i),dq(2,i),dq(3,i),dq(4,i),dq(5,i),...
                        u(1,i),u(2,i),...
                        p.l1,p.l2,p.l3,...
                        p.d1,p.d2,p.d3,...
                        p.m1,p.m2,p.m3,...
                        p.I1,p.I2,p.I3,...
                        p.g);
 
    % Invert EOM matrices to get ddq
    ddq(:,i) = D\(B*u(:,i) - C*dq(:,i) - G);                              
end    

% Construct state derivative vector
dz = [dq;ddq];

end