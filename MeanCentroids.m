function [centroids] = MeanCentroids(X,K,idx)
% computes the mean of all Xs in each centroid, which leads to a new
% centroid
% mean_centroids: K*dim

[m dim] = size(X);
centroids = zeros(K, dim);

for i=1:K
    count=0;
    for j=1:m
        if (idx(j)==i)
            count=count+1;
            centroids(i,:)=centroids(i,:)+X(j,:);
        end
    end
    centroids(i,:)=centroids(i,:)/count;
end

end

