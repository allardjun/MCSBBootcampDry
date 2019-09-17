% Matt Bovyn, mbovyn@uci.edu
% Set value of c and
% drive generate_fractal.m

% Set model parameter
c = -0.8 - 0.156*1i;

%set the path to the julia_fractal folder in your repo (must set for your computer!)
absolutePathToRepo='/path/to/repo';
%(or for Windows, 'path\to\repo')

%path to this script (should not be in repo)
localpath=pwd;

if strcmp(localpath,absolutePathToRepo)
    error('You were supposed to copy this to somewhere else!')
end

%run generate_fractal script
run([absolutePathToRepo '/codebase/generate_fractal.m'])

%save the unique identifier of the git commit used to generate the data
cd(absolutePathToRepo);
system('git log -1 --pretty=format:%H > "CommitUsedHash.txt"');
movefile('CommitUsedHash.txt',[ localpath '/CommitUsedHash.txt'])
cd(localpath);

% Save to file
save('juliaSetTest.mat', 'p', 'nmax');
