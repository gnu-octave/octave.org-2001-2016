function make_figure (name, dev)
  figure (1);
  eval (name);
  devopt = strcat ("-d", dev);
  file = strcat (name, ".", dev);
  print (devopt, file);
endfunction
