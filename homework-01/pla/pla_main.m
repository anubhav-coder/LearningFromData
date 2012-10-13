addpath ("../common");

clear all;
close all;
clc;

% Number of dimensions (excluding the synthetic dimension x0, which
% will be added later)
d = 2;

% Number of examples, change this according to the question
N = 100;

hold on;

title ("Perceptron Learning Algorithm (PLA)");
xlabel ("x values");
ylabel ("y values");

% X/Y range where the examples will be plotted
spc = [-1, 1];

% Loops until we find negative and positive examples
while (1)
  % Two random points used in target function f
  fp1 = rangenorm (spc, rand (2, 1));
  fp2 = rangenorm (spc, rand (2, 1));

  f = @(x) target (fp1, fp2, x);

  % N random examples
  X = rangenorm (spc, rand (N, d));

  % Uses the target function to set the desired labels
  y = arrayfun (@(x, y) side (f, x, y), X(:,1), X(:,2));

  % Checks to see if there are both positive and negative examples
  pos = find (y > 0);
  neg = find (y < 0);

  if (any (pos) && any (neg))
    break;
  end
end

% Plots the equation created from the two points
fplot (f, spc, "r-");

% Plots the examples
plot (X(pos,1), X(pos,2), "b+", "MarkerSize", 8);
plot (X(neg,1), X(neg,2), "ko", "MarkerFaceColor", "y", "MarkerSize", 8);

% Introduce the synthetic dimension x0
X = [ones(N, 1), X];

% Maximum number of iterations
maxiter = 10000;

% Initial weight vector
w = zeros (size (X,2), 1);

% Weight vector w after training
w = pla (X, y, w, @hypothesis, maxiter, 0);

% Plots the decision boundary based on the weight vector
plotboundary (spc, w, "g-");

legend ("Target function", "", "", "PLA boundary");
