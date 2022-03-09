std_dev = 4 ;
sigma = [0.001 0.1 0.2 0.9 1 2 3 5 10 20 100] ;
T = std_dev.*randn(750,1) ;
V = std_dev.*randn(250,1) ;

% % % % % % % % % % % % % part(c)
ll = zeros(size(sigma)) ;
for i=1:size(sigma,2)
    s = sigma(i) ;
    for j=1:size(V,1)
        temp = sum(exp(-((V(j,1)-T).^2)./(2*s*s))) ;
        ll(1,i) = ll(1,i) + log(temp/(750*s*sqrt(2*pi))) ;
    end
end
plot(log(sigma),ll) ;
xlabel("log(sigma) values)") ;
ylabel("LL") ;
[value,index] = max(ll) ;
in=index;
index = sigma(index) ;
fprintf("The value of sigma at which the maximum value occurs :%d \n ",index) ;
x = (-8:0.1:8) ;
p = zeros(size(x)) ;
for i=1:size(x,2)
    p(1,i) = sum(exp(-((x(1,i)-T).^2)./(2*index*index)))/(750*index*sqrt(2*pi)) ;
end
figure(2);
plot(x,p,'color','red') ;
hold on ;
plot(x,normpdf(x,0,std_dev),'color','blue') ;
legend('Kernel density','True density') ;
title("Sigma at which LL is maximum");
hold off ;

% % % % % % % % % % % %  part (d)

D = zeros(size(sigma));
for i=1:size(sigma,2)
    s = sigma(i);
    for j=1:size(V,1)
        D(1,i)= D(1,i)+ (normpdf(V(j,1),0,std_dev)-sum(exp(-((V(j,1)-T).^2)./(2*s*s)))/(750*s*sqrt(2*pi)))^2;
    end
end
figure(3);
plot(log(sigma),D);
xlabel("log(sigma) values");
ylabel("D");
[value,index2]=min(D);
index2=sigma(index2);
fprintf("The value of sigma at which the minima of D occurs is :%d \n " ,index2);
fprintf("The value of D for sigma at which LL is maximum is :%d \n " , D(1,in));

x = (-8:0.1:8) ;
p2 = zeros(size(x)) ;
for i=1:size(x,2)
    p2(1,i) = sum(exp(-((x(1,i)-T).^2)./(2*index2*index2)))/(750*index2*sqrt(2*pi)) ;
end
figure(4);
plot(x,p2,'color','red') ;
hold on ;
plot(x,normpdf(x,0,std_dev),'color','blue') ;
legend('Kernel density','True density') ;
title("Sigma at which D is minimum");
hold off ;