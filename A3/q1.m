E = zeros(1000,1) ;
N = (1:1:1000) ;
for n=1:1000
    I = (1:n) ;
    for i=1:n
        E(n) = E(n)+(n/(n-I(i)+1)) ;
    end
end
plot(N,E) ;
xlabel("value of n") ;
ylabel("E(X^{(n)})");
