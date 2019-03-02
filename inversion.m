A=[-1 2 0; 4 -3 1; 1 4 2]; 
invA=inv(A);

numcykle=1000;	% pocet generacii
lpop=30; % velkost populacie
Space=[ones(1,9)*(-5);ones(1,9)*5]; % rozsah hodnot urceny od -5 do 5
Pop=genrpop(lpop,Space); % generovanie populacie z daneho rozsahu

Fit=fitness(Pop, A);
[minFit, indx]=min(Fit); % najdenie najlepsieho (minimalneho) retazca
minRet=Pop(indx,:); % ulozenie najlepsieho retazca do pomocnej premennej
grafFit=zeros(1,numcykle);

for i=1:numcykle
    NewPop1=selbest(Pop, Fit, [3 1]); % 3 najlepsich a 1 nahodny vyber prvkov
    NewPop2=selrand(Pop, Fit, 26); % nahodne vybrane ostatne chybajuce prvky do poppulacie
    CrossedPop=crossov(NewPop2, 2, 0); % krizenie
    MutedPopX=mutx(CrossedPop, 0.05, Space); % mutacia
    MutedPopA=muta(MutedPopX, 0.05, [1 1 1 1 1 1 1 1 1]*0.05, Space); % mutacia
    Pop=[NewPop1; MutedPopA]; % Spojenie najlepsich a zmutovanych jedincov

    Fit=fitness(Pop, A);
    [minFitnew,indx]=min(Fit); % najdenie najlepsieho (minimalneho) retazca
    if minFitnew<minFit % porovnanie min. a v pripade potreby zmena min. hodnoty
        minFit=minFitnew;
        minRet=Pop(indx,:);
    end
    grafFit(i)=minFit; % ulozenie minimalnej hodnoty po kazdej generacii (iteracii)
end

% matrix=reshape(minRet, [3 3])
% invA
minFit

plot(grafFit, 'r');
legend('difference');