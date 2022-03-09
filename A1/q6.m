x = [-3:0.02:3] ;
y = 5*sin(1.8*x+pi/3) ;
f = 0.6 ;
plot(x,y,'color','blue') ;
random = 100 + 20*(rand(1,f*(length(y)-1))) ;
temp = (1-f)*(length(y)-1) ;
random = horzcat(random,zeros(1,temp+1)) ;
random = random(randperm(length(y))) ;
z = y+random ;
hold on ;
plot(x,z,'color','red') ;
% moving median filtering %
ymedian = zeros(size(z)) ;
for i=1:size(z,2)
    if (i<=8) 
        ymedian(1,i)=median(z(1,1:i+8)) ;
    elseif (i>(size(z,2)-8))
        ymedian(1,i)=median(z(1,(i-8):size(z,2))) ;
    else
        ymedian(1,i)=median(z(1,(i-8):(i+8))) ;
    end
end
error_ymedian = sum((y-ymedian).^2)/sum(y.^2) ;
fprintf("Mean squared error using median filtering for f=%d is %s.\n",f,error_ymedian) ;
hold on ;
plot(x,ymedian,'color','green') ;
% moving average filtering %
ymean = zeros(size(z)) ;
for i=1:size(z,2)
    if (i<=8) 
        ymean(1,i)=mean(z(1,1:i+8)) ;
    elseif (i>(size(z,2)-8))
        ymean(1,i)=mean(z(1,(i-8):size(z,2))) ;
    else
        ymean(1,i)=mean(z(1,(i-8):(i+8))) ;
    end
end
error_ymean = sum((y-ymean).^2)/sum(y.^2) ;
fprintf("Mean squared error using mean filtering for f=%d is %s.\n",f,error_ymean) ;
hold on ;
plot(x,ymean,'color','magenta') ;
% moving quartile filtering %
yquartile = zeros(size(z)) ;
for i=1:size(z,2)
    if (i<=8) 
        quartil = quartile(z(1,1:i+8)) ;
        yquartile(1,i)=quartil(1,1) ;
    elseif (i>(size(z,2)-8))
        quartil = quartile(z(1,(i-8):size(z,2))) ;
        yquartile(1,i)=quartil(1,1) ;
    else
        quartil = quartile(z(1,(i-8):(i+8))) ;
        yquartile(1,i)=quartil(1,1) ;
    end
end
error_yquartile = sum((y-yquartile).^2)/sum(y.^2) ;
fprintf("Mean squared error using quartile filtering for f=%d is %s.\n",f,error_yquartile) ;
hold on ;
plot(x,yquartile,'color','black') ;
legend('y','z','ymedian','ymean','yquartile') ;
