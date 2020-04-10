#the vector p1 corresponds to the digit 0
p1T = [-1,1,1,1,1,-1, 1,-1,-1,-1,-1,1, 1,-1,-1,-1,-1,1, 1,-1,-1,-1,-1,1, -1,1,1,1,1,-1]

#the vector p2 corresponds to the digit 1
p2T = [-1,-1,-1,-1,-1,-1, 1,-1,-1,-1,-1,-1, 1,1,1,1,1,1, -1,-1,-1,-1,-1,-1, -1,-1,-1,-1,-1,-1]

#the vector p3 corresponds to the digit 2
p3T = [1,-1,-1,-1,-1,-1, 1,-1,-1,1,1,1, 1,-1,-1,1,-1,1, -1,1,1,-1,-1,1, -1,-1,-1,-1,-1,1]

function retval = hardlims(v)
  retval = 0;
  for i = 1:length(v)
    if (v (i) != 0)
      #printf("v(1,%d): %d\n", i, v(1,i));
      if (v(1,i) >=0)
         v(1,i) = 1;
      else
         v(1,i) = -1;
      endif
    endif
  endfor
  retval = v;
endfunction

function retval = check_is_digit0(v)
  retval = 0;
  p1T = [-1,1,1,1,1,-1, 1,-1,-1,-1,-1,1, 1,-1,-1,-1,-1,1, 1,-1,-1,-1,-1,1, -1,1,1,1,1,-1]
  for i = 1:length(v)
    if (v(i) != 0)
       if (v(1,i) != p1T(1,i))
         printf("this input value is not digit 0\n");
         return;
        endif
    endif
  endfor
  printf("this input value is digit 0\n");
 endfunction
 

 function retval = check_is_digit1(v)
  retval = 0;
  p2T = [-1,-1,-1,-1,-1,-1, 1,-1,-1,-1,-1,-1, 1,1,1,1,1,1, -1,-1,-1,-1,-1,-1, -1,-1,-1,-1,-1,-1]
  for i = 1:length(v)
    if (v(i) != 0)
       if (v(1,i) != p2T(1,i))
         printf("this input value is not digit 1\n");
         return;
        endif
    endif
  endfor
  printf("this input value is digit 1\n");
 endfunction
 
function retval = check_is_digit2(v)
  retval = 0;
  p3T = [1,-1,-1,-1,-1,-1, 1,-1,-1,1,1,1, 1,-1,-1,1,-1,1, -1,1,1,-1,-1,1, -1,-1,-1,-1,-1,1]
  for i = 1:length(v)
    if (v(i) != 0)
       if (v(1,i) != p3T(1,i))
         printf("this input value is not digit 2\n");
         return;
        endif
    endif
  endfor
  printf("this input value is digit 2\n");
 endfunction

p1 = p1T'
p2 = p2T'
p3 = p3T'

# orthogonal check,0 is ortogonal 1 is not
O1 = dot(p1,p2);
O1
O2 = dot(p1,p3);
O2
O3 = dot(p2,p3);
O3

W1 = p1 * p1T
W2 = p2 * p2T
W3 = p3 * p3T
W = W1+ W2+ W3

#verfiy fingure 7.3
#using half of the pattern,which is digit0 
p1T_half = [-1,1,1,-1,-1,-1, 1,-1,-1,-1,-1,-1, 1,-1,-1,-1,-1,-1, 1,-1,-1,-1,-1,-1, -1,1,1,-1,-1,-1]
p1_half = p1T_half'
a_p1_1 = W1 * p1_half
a_p1_2 = W2 * p1_half
a_p1_3 = W3 * p1_half
a_p1 = a_p1_1 + a_p1_2 + a_p1_3
a_p1T = a_p1'
y_p1 = hardlims(a_p1T);
check_is_digit0(y_p1);


#using half of the pattern,which is digit1
p2T_half = [-1,-1,-1,-1,-1,-1, 1,-1,-1,-1,-1,-1, 1,1,1,1,1,1, -1,-1,-1,-1,-1,-1, -1,-1,-1,-1,-1,-1]
p2_half = p2T_half'
a_p2_1 = W1 * p2_half
a_p2_2 = W2 * p2_half
a_p2_3 = W3 * p2_half
a_p2 = a_p2_1 + a_p2_2 + a_p2_3
a_p2T = a_p2'
y_p2 = hardlims(a_p2T);
check_is_digit1(y_p2);


#using half of the pattern,which is digit2
p3T_half = [1,-1,-1,-1,-1,-1, 1,-1,-1,-1,-1,-1, 1,-1,-1,-1,-1,-1, -1,1,1,-1,-1,-1, -1,-1,-1,-1,-1,-1]
p3_half = p3T_half'
a_p3_1 = W1 * p3_half
a_p3_2 = W2 * p3_half
a_p3_3 = W3 * p3_half
a_p3 = a_p3_1 + a_p3_2 + a_p3_3
a_p3T = a_p3'
y_p3 = hardlims(a_p3T);
check_is_digit2(y_p3);



#verfiy fingure 7.5
#using noisy of the pattern,which is digit0 
p1T_noisy = [-1,1,1,-1,1,-1, -1,-1,-1,-1,-1,1, 1,-1,-1,-1,1,-1, 1,1,-1,-1,1,-1, -1,-1,1,-1,1,-1]
p1_noisy = p1T_noisy'
a_p1_1 = W1 *p1_noisy
a_p1_2 = W2 *p1_noisy
a_p1_3 = W3 *p1_noisy
a_p1 = a_p1_1 + a_p1_2 + a_p1_3
a_p1T = a_p1'


#using noisy of the pattern,which is digit1
p2T_noisy = [-1,-1,1,-1,-1,1, 1,-1,-1,-1,-1,1, 1,1,1,-1,1,1, -1,1,-1,-1,-1,1, -1,-1,-1,1,-1,-1]
p2_noisy = p2T_noisy'
a_p2 = W *p2_noisy
a_p2T = a_p2'


#using noisy of the pattern,which is digit2
p3T_noisy = [1,-1,-1,-1,-1,-1, 1,1,-1,1,-1,1, 1,-1,-1,1,-1,1, -1,1,-1,-1,-1,-1, 1,1,1,-1,-1,1]
p3_noisy = p3T_noisy'
a_p3 = W *p3_noisy
a_p3T = a_p3'

y_p1 = hardlims(a_p1T);
check_is_digit0(y_p1);

y_p2 = hardlims(a_p2T);
check_is_digit1(y_p2);

y_p3 = hardlims(a_p3T);
check_is_digit2(y_p3);





