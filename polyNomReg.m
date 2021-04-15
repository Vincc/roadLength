Xo = [2.15 1.85 1.7 1.55 1.3 1.14 1.1 0.9 0.66 0.57 0.55 0.4 0.2 0 -0.15]';
y = [2.5 2.2 1.85 1.5 1 0.2 -0.1 -0.4 -0.35 -0.5 -0.7 -1.1 -1.4 -1.52 -1.6]';
n = 10
c = rand(n+1,1)

##p = polyfit(X,y,6);
##
##
##Xc = linspace(2.15,-0.15)
##yc = polyval(p,Xc)
##
##
##
##yc
##
##plot(X,y)
##hold on
##plot(Xc,yc)
##hold off

##X = [Xo.^6 Xo.^5 Xo.^4 Xo.^3 Xo.^2 Xo ones(15,1)]
X=[Xo ones(15,1)]
for i = 2:n
  X = [Xo.^i X];
endfor
w = (X*c);
diff = y-w;
Err = (1/30)*((diff)'*(diff));
Err = (1/30)*(c'*X'*X*c - 2*(X*c)'*y+y'*y);
der = 2*X'*X*c - 2*X'*y ;
newc = (X'*X)^-1*X'*y;
neww = (X*newc);
 



plot(Xo,y)
hold on
plot(Xo,neww)
hold off

