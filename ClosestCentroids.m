function idx = ClosestCentroids(X, centroids)
% returns the centroid id for each example in X
% idx: m*1
K = size(centroids, 1);
idx = zeros(size(X,1), 1);
dim=size(X,2);

for i=1:size(X,1)
    sqDist=0;
    for d=1:dim
        sqDist=sqDist+(centroids(1,d)-X(i,d))^2;
    end
    Dist=sqrt(sqDist);
    idx(i)=1;
    for j=2:K
        temp=0;
        for d=1:dim
            temp=temp+(centroids(j,d)-X(i,d))^2;
        end
        temp=sqrt(temp);
        if (Dist>temp)
            Dist=temp;
            idx(i)=j;
        end
    end
end

idx=idx(:);

end

