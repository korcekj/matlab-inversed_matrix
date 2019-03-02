% Fitness function of polynomial regression
% Search space: -5 < x(i) < 5

function [Fit] = fitness(Pop, A)

    [lpop,lstring]=size(Pop); % Zistenie velkosti matrice Pop -> pocet riadkov, stlpcov
    invA=inv(A);
    invA=invA(:)';
    
    for i=1:lpop
        diff=abs(Pop(i,:)-invA);
        Fit(i)=sum(diff(:));
    end
    
end

