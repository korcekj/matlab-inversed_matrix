% Fitness function of matrix inversion
% Search space: -5 < x(i) < 5

function [Fit] = fitness(Pop, A)

    [lpop,lstring]=size(Pop); % zistenie velkosti matrice Pop -> pocet riadkov, stlpcov
    oneM=[1 0 0; 0 1 0; 0 0 1];
    
    for i=1:lpop
        invM=reshape(Pop(i,:), [3 3]);
        multiM=A*invM;
        diff=abs(multiM - oneM);
        Fit(i)=sum(diff(:));
    end
    
end

