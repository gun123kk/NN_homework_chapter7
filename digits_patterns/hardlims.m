function retval = hardlims(v)
  retval = 0;
  for i = 1:length(v)
    if (v (i) != 0)
      printf("v(1,%d): %d\n", i, v(1,i));
      if (v(1,i) >=0)
         v(1,i) = 1;
      else
         v(1,i) = -1;
      endif
    endif
  endfor
  retval = v;
endfunction

a = [10,-28,7,0,-30]
y = hardlims(a);
y