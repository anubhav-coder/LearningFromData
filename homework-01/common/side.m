% Function that gives a label for the target point. This is the
% function we'll reverse engineer with the weight vector w
function retval = side (f, x, y)
  retval = sign (f (x) - y);
end
