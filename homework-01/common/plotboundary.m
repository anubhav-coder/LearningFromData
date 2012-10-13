% Plots the decision boundary based on the weight vector
function plotboundary (x, w, plotstr)
  y = (-1 ./ w(3)) .* (w(2) .* x + w(1));
  plot (x, y, plotstr)
end
