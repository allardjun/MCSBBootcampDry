% generate one million points on [-2,2] and [-2i,2i] then run follow_z on
% each point

numPts=floor(sqrt(10^6));

p=4*(rand(numPts)-.5)+4*1i*(rand(numPts)-.5);
nmax=zeros(size(p,1)*size(p,2),1);

for k=1:size(p,1)*size(p,2)
    [~,nmax(k)]=follow_z(p(k),c);
end