% Runs the perceptron algorithm to find the decision boundary
function v = pla (X, y, w, hypothesis, maxiter, runmode)
  cnt = 0;
  nw = w;

  while (cnt < maxiter)
    m = misclassified (X, y, nw, hypothesis);

    % Tests algorithm convergence
    if (!any (m))
      break;
    end

    % Randomly picks the index of a misclassified item
    sm = size (m, 1);
    n = fix (rangenorm ([1, sm], rand));

    % Updates the weight vector accordingly
    nw = nw + X(m(n),:)' * y(m(n),1);

    % Only increments the counter if there's change
    cnt++;
  end

  % runmode = 0 : Returns weight vector
  % runmode = 1 : Returns number of iterations taken
  if (!runmode)
    v = nw;
  else
    v = cnt;
  end
end
