clear, clc, close all

data = csvread('heart_disease.csv');

% data processing
data = data(2:end, :);    % first row is empty
[mAll, ~] = size(data);
train_split = 0.9;
val_split = 0.05;
[X, y, Xval, yval, Xtest, ytest] = testTrainValSplit (data, mAll, train_split, val_split);

[m, n] = size(X);

% raw visualization
figure 1
hold on
plotData_2D(X(:, [1 5]), y);
xlabel('age (years)');
ylabel('cholestoral (mg/dl)');
title('heart disease: two raw features');

% PCA for visualization

A = standardize(X);       % standardize features
S = (1/m)*A'*A;
[U, W, V] = eig(S);
Uvis_2D = A*U(:, 1:2);    % 2 principle components for 2D visualization 
Uvis_3D = A*U(:, 1:3);    % 3 principle components for 3D visualization 

% selecting K to retain 99% varience
%eigVals = sum(W);
%eigTotal = sum(eigVals);
%K = n;
%for k = 1:n
%  kVar = sum(eigVals(1:k));
%  if kVar/eigTotal >= 0.99
%    K = k;  
%  endif
%endfor


% reconstruction
Xrec = Uvis_3D*U(:, 1:3)'

figure 2;
hold on
plotData_2D(Uvis_2D, y);
xlabel('principle component 1');
ylabel('principle component 2');
title('heart disease: first two principle components');


plotData_3D(Uvis_3D, y);
xlabel('principle component 1');
ylabel('principle component 2');
zlabel('principle component 3');
title('heart disease: first three principle components');