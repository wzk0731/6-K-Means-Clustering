function centroids = InitCentroids( X, K )
%InitCentroids: This function initializes K centroids from the entire
%sample space that are to be  used in K-Means on the dataset X

X1_low=vpa(min(X(:,1)));
X1_high=vpa(max(X(:,1)));
X2_low=vpa(min(X(:,2)));
X2_high=vpa(max(X(:,2)));

centroids = zeros(K, size(X, 2));
centroids(:,1)=transpose(X1_low+rand(1,K)*(X1_high-X1_low));
centroids(:,2)=transpose(X2_low+rand(1,K)*(X2_high-X2_low));
end

