% Returns the indexes of the misclassified examples, if they exist
function retval = misclassified (X, y, w, hypothesis)
  retval = find (bsxfun (@(n, y) hypothesis (w, X(n,:)) != y, [1:size(X)]', y));
end
