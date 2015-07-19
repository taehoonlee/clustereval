# clustereval
Easy clustering evaluation in MATLAB.<br />
Copyright (c) 2015 Taehoon Lee

# Usage
Input arguments are two clustering results and metric name.<br />
`clustereval(a, b, 'metric name')`

# Example Code
```
X = rand(100, 2);
Z = linkage(X, 'average', 'euclidean');
a = cluster(Z, 'maxclust', 4);
b = kmeans(X, 4);
clustereval(a, b, 'ari') % adjusted Rand index
```

# Implemented Metrics
<li> `ri`: the Rand Index </li>
Rand, "Objective Criteria for the Evaluation of Clustering Methods", *JASA*, 1971.
<li> `mi`: the Mirkin index </li>
<li> `hi`: the Hubert index </li>
<li> `ari`: adjusted Rand index </li>
Hubert and Arabie, "Comparing partitions", *Journal of Classification*, 1985.
<li> `fowlkes`: the Fowlkes-Mallows index </li>
Fowlkes and Mallows, "A Method for Comparing Two Hierarchical Clustering", *JASA*, 1983.
<li> `chi`: Pearson's chi-square test </li>
Chernoff and Lehmann, "The Use of Maximum Likelihood Estimates in \chi^2 Tests for Goodness of Fit", *AMS*, 1954.
<li> `cramer`: Cramer's coefficient </li>
<li> `tchouproff`: Tchouproff's coefficient </li>
<li> `moc`: the Measure of Concordance </li>
Pfitzner et al., "Characterization and evaluation of similaritymeasures for pairs of clusterings", *KIS*, 2009.
<li> `nmi`: Normalized Mutual Index </li>
Strehl and Ghosh, "Cluster ensembles - a knowledge reuse framework for combining multiple partitions", *JMLR*, 2002.