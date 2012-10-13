% Calculates the Eout for weight vector w
function diff = diffprob (d, spc, f, w, count)
  X = rangenorm (spc, rand (count, d));
  X = [ ones(count, 1), X ];

  y  = arrayfun (@(x, y) side (f, x, y), X(:,2), X(:,3));
  hy = bsxfun (@(n, y) hypothesis (w, X(n,:)) != y, [1:size(X)]', y);

  diff = sum (hy) / size (X, 1);
end
