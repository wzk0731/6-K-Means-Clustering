function [J] = computeCost(centroids, idx,X)
% returns J, the cost function
    J=0;
dim=size(X,2);
K=size(centroids,1);
for k=1:K
    for j=1:size(X,1)
        if (idx(j)==k)
            sqDist=0;
            for d=1:dim
                sqDist=sqDist+(centroids(k,d)-X(j,d))^2;
            end
            J=J+sqrt(sqDist);
        end
    end
end
end

