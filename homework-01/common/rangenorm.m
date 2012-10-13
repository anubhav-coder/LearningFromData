% Normalizes a number or a vector of numbers between 0 and 1 to be
% within rng - this is special function for normalization..
function retval = rangenorm (rng, v)
  retval = arrayfun (@(n) n * (rng(2) - rng(1)) + rng(1), v);
end
