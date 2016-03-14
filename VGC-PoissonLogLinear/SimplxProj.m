function X = SimplxProj(Y)
% Projects each row vector in the N by D marix Y to the probability
% simplex in D-1 dimensions 
[N, D] = size(Y); 
X = sort(Y, 2, 'descend'); 
Xtmp = (cumsum(X,2)-1)*diag(sparse(1./(1:D))); 
X = max(bsxfun(@minus, Y, Xtmp(sub2ind([N,D], (1:N)', sum(X>Xtmp,2)))),0); 
end