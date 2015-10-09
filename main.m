clear ; close all; clc
load('toy_data.mat');
X=toy_data;
K=4;

%-----------Part (a) K means------------------

%centroids: K*dim
initial_centroids = InitCentroids(X, K);

[centroids, idx] = runKmeans(X, initial_centroids);

palette = hsv(K + 1);
colors = palette(idx, :);
scatter(X(:,1),X(:,2),15, colors);

fprintf('Part (a) finished. Press enter to continue.\n');
pause;

%------------Part (b) Run 20 Iterations--------------
num_iter=20;
[centroids, idx] = runByIter(X, initial_centroids,num_iter);

fprintf('Part (b) finished. The plot are shown in Figure 2\n');
fprintf('As we can see, in the first few iterations, the distortion function\n');
fprintf('decreases as the iteration goes on. Then, as the function converges,\n');
fprintf('the value of the distortion function stays the same.\n');
fprintf(' Press enter to continue.\n');
pause;

%------------Part (c) Image Compression--------------
A = double(imread('bird_small.tiff'));
imshow(uint8(round(A)))
A=A/255;

X_unroll=reshape(A, size(A,1)*size(A,2),3);
K=16;
initial_centroids = InitCentroids(X_unroll, K);
[centroids, idx] = runKmeans(X_unroll, initial_centroids);

%X_recovered = centroids(idx,:);
%X_recovered = reshape(X_recovered, size(A,1), size(A,2), 3);
%figure;
%imagesc(X_recovered);
X_new=zeros(size(X_unroll));

for i=1:size(X_new,1)
    for j=1:K
        if (idx(i)==j)
            X_new(i,:)=centroids(j,:);
        end
    end
end

X_new=reshape(X_new, size(A,1), size(A,2),3);
figure;
imagesc(X_new);




