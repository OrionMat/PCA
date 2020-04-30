function A = standardize(X)
  
  % zero mean
  avg = mean(X);
  A = X - avg;
  
  % scale features
  stdev = std(A);
  A = A ./ stdev;
  
endfunction
