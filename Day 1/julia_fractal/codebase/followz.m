% Jun Allard jun.allard@uci.edu & Matt Bovyn mbovyn@uci.edu
% Compute the Julia Set
% for z1, does the mapping z(n+1)=z(n)^2+c, z(1)=z1 go to infinity or
% remain finite? If it goes to infinity, we define z1 as in the Julia set. 
% https://en.wikipedia.org/wiki/Julia_set

function [namx,zTrajectory] = followz(zInitial,c)

    ntMax=22;
    
    % initial condition
    z = zInitial;
    
    if nargout>1
        zTrajectory(1)=z;
    end

    % time loop!
    nt=0;
    while (nt<ntMax && abs(z)<2)
    
        z = z.^2 + c;
        
        nt=nt+1;
        
        if nargout>1
            zTrajectory(nt+1)=z;
        end
    
    end % finished timestep loop
    
    namx = nt;

end