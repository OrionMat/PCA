function plotData_3D(X, y)

  % find indices of positive and negative Examples
  pos = find(y == 1); 
  neg = find(y == 0);

  figure;
  scatter3(X(pos, 1), X(pos, 2), X(pos, 3), [80], 'r',  '+');
  hold on
  scatter3(X(neg, 1), X(neg, 2), X(neg, 3), [80], 'b');

end