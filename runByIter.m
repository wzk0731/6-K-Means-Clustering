function [centroids, idx] = runByIter(X, initial_centroids, num_iter)
%runs 20 iterations of k means, compute the cost J in each
% iterations, and graph them

K = size(initial_centroids, 1);
idx = ClosestCentroids(X, initial_centroids);
mean_centroids=MeanCentroids(X,K,idx);
centroids=mean_centroids;
Js=zeros(num_iter,1);
Js(1)=computeCost(centroids,idx,X);

for i=2:num_iter
    idx = ClosestCentroids(X, centroids);
    mean_centroids=MeanCentroids(X,K,idx);
    centroids=mean_centroids;
    Js(i)=computeCost(centroids,idx,X);
end
Xs=(1:20)';
figure;
plot(Xs,Js)
xlabel('number of iterations') % x-axis label
ylabel('distortion function') % y-axis label
end

