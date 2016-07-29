function root3(x0,a)
   local x = x0
   for i=1:3
     x = (3*a*x+x^3)/(a+3*x^2)
   end
   return x
 end

root3(1,65)

sqrt(65)-root3(1,65)
