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
- `ri`: the Rand Index
  * Rand, "Objective Criteria for the Evaluation of Clustering Methods", *JASA*, 1971.
- `mi`: the Mirkin index
- `hi`: the Hubert index
- `ari`: adjusted Rand index
  * Hubert and Arabie, "Comparing partitions", *Journal of Classification*, 1985.
- `fowlkes`: the Fowlkes-Mallows index
  * Fowlkes and Mallows, "A Method for Comparing Two Hierarchical Clustering", *JASA*, 1983.
- `chi`: Pearson's chi-square test
  * Chernoff and Lehmann, "The Use of Maximum Likelihood Estimates in \chi^2 Tests for Goodness of Fit", *AMS*, 1954.
- `cramer`: Cramer's coefficient
- `tchouproff`: Tchouproff's coefficient
- `moc`: the Measure of Concordance
  * Pfitzner et al., "Characterization and evaluation of similaritymeasures for pairs of clusterings", *KIS*, 2009.
- `nmi`: Normalized Mutual Index
  * Strehl and Ghosh, "Cluster ensembles - a knowledge reuse framework for combining multiple partitions", *JMLR*, 2002.
