% Matt Bovyn, mbovyn@uci.edu
% Drive generate_fractal.m

% Set model parameter
c = -0.8 + 0.156*1i;

%run generate_fractal script
run('path/to/codebase/generate_fractal.m')

% Save to file
save('path/to/data/juliaSet.mat', 'p', 'nmax');
