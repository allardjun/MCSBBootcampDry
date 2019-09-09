function [z2,nmax] = follow_z(z1,c)
% take in complex values, perform z(n+1)=z(n)^2 until abs(z).2 or n>21

% initialize
z2=z1;
nmax=1;

while nmax<22 && abs(z2(end))<=2
   nmax=nmax+1;
   z2(nmax)=z2(nmax-1).^2+c;
end

end

