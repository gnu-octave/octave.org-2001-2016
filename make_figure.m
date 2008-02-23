function make_figure (name, dev)
  figure (1, "visible", "off");
  eval (name);
  devopt = strcat ("-d", dev);
  file = strcat (name, ".", dev);
  print (devopt, file);
  sleep (1)
endfunction
