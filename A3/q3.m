f = dlmread('XYZ.txt');
x=f(:,1);
y=f(:,2);
z=f(:,3);
x2=x.^2;
x3=x.^3;
x4=x.^4;
y2=y.^2;
y3=y.^3;
y4=y.^4;
xy=x.*y;
xz=x.*z;
yz=y.*z;
x2y=x2.*y;
x2y2=x2.*y2;
x3y=x3.*y;
xy2=x.*y2;
xy3=x.*y3;
zx2=z.*x2;
zy2=z.*y2;
zxy=xz.*y;


A=[mean(x2) mean(xy) mean(x); mean(xy) mean(y2) mean(y); mean(x) mean(y) 1];
B=[mean(xz); mean(yz); mean(z)];
X=A\B;
a=X(1,:);
b=X(2,:);
c=X(3,:);

o=['equation of plane = ' num2str(a),'x + ', num2str(b),'y + ',num2str(c)];
disp("part A")
disp(o)
Zexact=x.*a + y.*b + c;
V = var(z-Zexact);
o1=['noise variance = ' num2str(V)];
disp(o1);

disp(" ")

A1 = [mean(x4)     mean(x2y2) mean(x3y)  mean(x3)  mean(x2y) mean(x2);
      mean(x2y2)   mean(y4)   mean(xy3)  mean(xy2) mean(y3)  mean(y2);
      mean(x3y)    mean(xy3)  mean(x2y2) mean(x2y) mean(xy2) mean(xy);
      mean(x3)     mean(xy2)  mean(x2y)  mean(x2)  mean(xy)  mean(x);
      mean(x2y)    mean(y3)   mean(xy2)  mean(xy)  mean(y2)  mean(y);
      mean(x2)     mean(y2)   mean(xy)   mean(x)   mean(y)   1];
B1 = [mean(zx2); mean(zy2); mean(zxy); mean(xz); mean(yz); mean(z)];
X1 = A1\B1;
a1 = X1(1,:);
a2 = X1(2,:);
a3 = X1(3,:);
a4 = X1(4,:);
a5 = X1(5,:);
a6 = X1(6,:);

o2 = ['equation of plane = ' num2str(a1),'x^2 + ', num2str(a2),'y^2 + ', num2str(a3),'xy + ', num2str(a4), 'x + ', num2str(a5),'y + ', num2str(a6)];
disp("part B")
disp(o2);
Zexact1=x2.*a1 + y2.*a2 + xy.*a3 + x.*a4 + y.*a5 + a6;
V1=var(z-Zexact1);
o3=['noise variance = ' num2str(V1)];
disp(o3)
