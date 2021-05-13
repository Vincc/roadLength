Xoriginal = [2.15 1.85 1.7 1.55 1.3 1.14 1.1 0.9 0.66 0.57 0.55 0.4 0.2 0 -0.15]';
y = [2.5 2.2 1.85 1.5 1 0.2 -0.1 -0.4 -0.35 -0.5 -0.7 -1.1 -1.4 -1.52 -1.6]';
n = 10;
ns = 21;
c = rand(n+1,1);

#creating input matrix
X=[Xoriginal ones(15,1)];
for i = 2:n
  X = [Xoriginal.^i X];
endfor

#polynomial regression: normal equations
w = (X*c);
diff = y-w;
Err = (1/30)*((diff)'*(diff));
Err = (1/30)*(c'*X'*X*c - 2*(X*c)'*y+y'*y);
der = 2*X'*X*c - 2*X'*y ;
newc = (X'*X)^-1*X'*y;
neww = (X*newc);
 
#finding term to be integrated for arclength

derC = newc(1:n);
temC = [];
for i = 0:n-1
  temC = [temC n-i];
endfor
temC
derC = temC'.*derC


derX = [Xoriginal ones(15,1)];
for i = 2:n-1
  derX = [Xoriginal.^i derX];
endfor

inte = (((derX * derC).^2).+1).^(1/2);

#applying Simpson's rule
simpscoeff = [1];

for i = 1:((ns-3)/2)
 simpscoeff = [simpscoeff 4 2];
endfor
simpscoeff = [simpscoeff 4 1]';

xsimps = [];
for i = 0: ns-1
  xsimps = [xsimps -0.15 + (i*0.115)];
endfor
xsimps = xsimps';
xsimpsout = [[xsimps ones(ns,1)]];
for i = 2:n-1;
  xsimpsout = [xsimps.^i xsimpsout];
endfor



arclength = (0.115/3) * ((xsimpsout*derC)'*simpscoeff)


##plotting graphs
plot(Xoriginal,y)
hold on
plot(Xoriginal,neww)
hold off
##plot(Xoriginal,inte)
