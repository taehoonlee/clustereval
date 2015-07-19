function out = clustereval(a, b, method)
%CLUSTEREVAL Easy clustering evaluation in MATLAB.
%   CLUSTEREVAL works with various evaluation metrics.
%
%   Example:
%
%       X = rand(100, 2);
%       Z = linkage(X, 'average', 'euclidean');
%       a = cluster(Z, 'maxclust', 4);
%       b = kmeans(X, 4);
%       clustereval(a, b, 'ari') % adjusted Rand index

%   Copyright (c) 2015 Taehoon Lee

if nargin < 2 || min(size(a)) > 1 || min(size(b)) > 1 || numel(a) ~= numel(b)
   error('First two arguments must be two vectors with the same length.');
end

method = lower(method);
    n = numel(a);
    I = max(a);
    J = max(b);
    C = zeros(I, J);
    for i = 1:I
        tmp = a==i;
        for j = 1:J
            C(i,j) = sum(tmp & b==j);
        end
    end

    nis = sum(sum(C,2).^2);
    njs = sum(sum(C,1).^2);
    
    nc2 = nchoosek(n, 2);
    n2 = sum(C(:).^2);
    n3 = (nis + njs) / 2;

    A = nc2 + n2 - n3;
    D = n3 - n2;
    
    CC = C.^2;
    CC = bsxfun(@rdivide, CC, sum(CC, 1));
    CC = bsxfun(@rdivide, CC, sum(CC, 2));
    chi = ( sum(sum(CC, 1), 2) - 1 ) * n;
    
    C = C / n;
    
    switch method
    case {'randindex', 'ri'}
        out = A / nc2;
    case {'mirkinindex', 'mi'}
        out = D / nc2;
    case {'hubertindex', 'hi'}
        out = (A - D) / nc2;
    case {'adjustedrandindex', 'adjustedri', 'adjustri', 'ari'}
        nc = (n*(n^2+1)-(n+1)*nis-(n+1)*njs+2*(nis*njs)/n) / (2*(n-1));
        if nc2 == nc
            out = 0;
        else
            out = (A-nc)/(nc2-nc);
        end
    case {'chisquared', 'chisquare', 'chi'}
        out = chi;
    case 'cramer'
        out = sqrt( chi / n / min(I-1, J-1) );
    case 'tchouproff'
        out = sqrt( chi / n / sqrt((I-1)*(J-1)) );
    case 'moc'
        if numel(C) == 1
            out = 1;
        else
            out = chi / n / ( sqrt(I*J) - 1 );
        end
    case 'nmi'
        Pxy = nonzeros(C);
        Px = mean(C, 1);
        Py = mean(C, 2);
        Hxy = -dot(Pxy, log2(Pxy+eps));
        Hx = -dot(Px, log2(Px+eps));
        Hy = -dot(Py, log2(Py+eps));
        MI = Hx + Hy - Hxy;
        out = sqrt((MI/Hx)*(MI/Hy));
    end
    
end