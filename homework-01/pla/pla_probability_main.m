addpath ("../common");

% Number of times the algorithm will run in order to calculate the
% average number of steps taken
iters = 1000;

% X/Y range where the examples will be plotted
spc = [-1, 1];

% Number of dimensions (excluding the synthetic dimension x0, which
% will be added later)
d = 2;

% Number of examples. Change this according to the question
N = 10;

pr = zeros (iters,1);

for n = 1:iters

  % Two random points used in target function f
  fp1 = rangenorm (spc, rand (2, 1));
  fp2 = rangenorm (spc, rand (2, 1));

  f = @(x) target (fp1, fp2, x);

  % N random examples
  X = rangenorm (spc, rand (N, d));

  % Uses the target function to set the desired labels
  y = arrayfun (@(x, y) side (f, x, y), X(:,1), X(:,2));

  % Introduce the synthetic dimension x0
  X = [ones(N,1), X];

  % Maximum number of iterations
  maxiter = 10000;

  % Initial weight vector
  w = zeros (size (X,2), 1);

  % Weight vector w after training
  w = pla (X, y, w, @hypothesis, maxiter, 0);

  % Updates the difference probability between f and w
  pr(n) = diffprob (d, spc, f, w, 1000);
end

fprintf ("Average of the difference between f(x) and g(x): %f\n", mean (pr));
