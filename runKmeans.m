function [centroids, idx] =runKmeans(X, initial_centroids)

K = size(initial_centroids, 1);
% idx returns the centroid id for each example in X
% idx(i): for the ith example it's assigned to the idx(i) centroid
idx = ClosestCentroids(X, initial_centroids);
mean_centroids=MeanCentroids(X,K,idx);
checkidx=idx;
centroids=mean_centroids;

while 1
    idx = ClosestCentroids(X, centroids);
    mean_centroids=MeanCentroids(X,K,idx);
    centroids=mean_centroids;
    
    %check if the new update is any different
    id_size=size(idx,1);
    comp=(idx==checkidx);
    comp_sum=sum(comp);
    if (comp_sum==id_size)
        break;
    end
    checkidx=idx;
end
end

