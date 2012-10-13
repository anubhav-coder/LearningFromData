% Our hypothesis function
function retval = hypothesis (w, x)
  retval = sign (x * w);
end
