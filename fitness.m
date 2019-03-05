% Fitness function of matrix inversion
% Search space: -5 < x(i) < 5

function [Fit] = fitness(Pop, A)

    [lpop,lstring]=size(Pop); % zistenie velkosti matrice Pop -> pocet riadkov, stlpcov
    invA=inv(A); % vypocet inverznej matice z matice A ako parameter funckie
    invA=invA(:)'; % transponovanie stlpca na riadok kvoli jednoduchsiemu vypoctu
    
    for i=1:lpop
        diff=abs(Pop(i,:)-invA); % vypocitanie rozdielu medzi vektorom hodnot inveznych matic
        Fit(i)=sum(diff(:)); % spocitanie rozdielov hodnot a priradenie hodnoty na riadok i
    end
    
end

