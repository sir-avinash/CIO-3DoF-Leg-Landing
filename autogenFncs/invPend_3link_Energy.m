function [U,T] = invPend_3link_Energy(q1,q2,q3,x,y,dq1,dq2,dq3,dx,dy,l1,l2,l3,d1,d2,d3,m1,m2,m3,I1,I2,I3,g)
%INVPEND_3LINK_ENERGY
%    [U,T] = INVPEND_3LINK_ENERGY(Q1,Q2,Q3,X,Y,DQ1,DQ2,DQ3,DX,DY,L1,L2,L3,D1,D2,D3,M1,M2,M3,I1,I2,I3,G)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    24-Jan-2016 03:09:19

t3 = sin(q1);
t4 = dq1.*l1.*t3;
t5 = sin(q2);
t2 = -dy+t4+d2.*dq2.*t5;
t6 = -dy+t4+d3.*dq3.*sin(q3)+dq2.*l2.*t5;
t8 = cos(q1);
t7 = dx+d1.*dq1.*t8;
t10 = dq1.*l1.*t8;
t11 = cos(q2);
t9 = dx+t10+d2.*dq2.*t11;
t14 = cos(q3);
t12 = dx+t10+d3.*dq3.*t14+dq2.*l2.*t11;
t13 = dy-d1.*dq1.*t3;
U = I1.*dq1.^2.*(1.0./2.0)+I2.*dq2.^2.*(1.0./2.0)+I3.*dq3.^2.*(1.0./2.0)+m2.*t2.^2.*(1.0./2.0)+m1.*t7.^2.*(1.0./2.0)+m3.*t6.^2.*(1.0./2.0)+m2.*t9.^2.*(1.0./2.0)+m1.*t13.^2.*(1.0./2.0)+m3.*t12.^2.*(1.0./2.0);
if nargout > 1
    t15 = l1.*t8;
    T = g.*m1.*(y+d1.*t8)+g.*m2.*(t15+y+d2.*t11)+g.*m3.*(t15+y+d3.*t14+l2.*t11);
end
