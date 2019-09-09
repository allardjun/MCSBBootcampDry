%% Test Julia set algorithm on a known case
% Matt Bovyn, mbovyn@uci.edu

% the core of our algorithm is z=z.^2 + c
% a simple test case for this algorithm is z0=1i, c=-1i.
% stepping though the algorithm mentally 
% (or "manually" with matlab) should reveal that 
% at these parameters, z goes back and forth 
% between 1i and -1+1i forever.

%since we stop the algorithm at 22, we know the correct output of the
%program for these parameters is an array which repeats i, -1-i, i ...
%ntMax times. The following code generates such an array
ntMax = 22;
a=(0+1i)*ones(1,ntMax);
b=(-1-1i)*ones(1,ntMax);
c=[a;b];
known_answer=c(1:ntMax+1);

% then we can compare the output of the program at these parameters

[~,zTrajectory]=followz(0+1i,0-1i);
disp('Output is')
disp(zTrajectory')

% to the known correct output as a test
if isequal(zTrajectory,known_answer)
    disp('test passed!')
else
    disp('test failed!')
end

