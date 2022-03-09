function [newMedian] = UpdateMedian (oldMedian, NewDataValue, A, n)

if mod(n, 2)==0
    if A(n/2) > NewDataValue
        newMedian=A(n/2);
    elseif A(n/2 + 1) < NewDataValue
        newMedian=A(n/2 + 1);
    else
        newMedian=NewDataValue;
    end
else
    if A((n-1)/2) > NewDataValue
        newMedian=(A((n-1)/2) + A((n+1)/2))/2;
    elseif A((n+3)/2) < NewDataValue
        newMedian=(A((n+1)/2) + A((n+3)/2))/2;
    else
        newMedian=(A((n+1)/2) + NewDataValue)/2;
    end
end