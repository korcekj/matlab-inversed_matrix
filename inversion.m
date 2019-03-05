A=[-1 2 0; 4 -3 1; 1 4 2]; % matica 3x3
invA=inv(A); % invezna matica pre porovnanie inverznich matic

numcykle=1000;	% pocet generacii
lpop=30; % velkost populacie
Space=[ones(1,9)*(-5);ones(1,9)*5]; % rozsah hodnot urceny od -5 do 5
Pop=genrpop(lpop,Space); % generovanie populacie z daneho rozsahu

Fit=fitness(Pop, A); % vyhodnotenie funkcie fitness
[minFit, indx]=min(Fit); % najdenie najlepsieho (minimalneho) retazca
minRet=Pop(indx,:); % ulozenie najlepsieho retazca do pomocnej premennej
grafFit=zeros(1,numcykle); % vytvorenie grafu pre zobrazenie genetickeho algoritmu

for i=1:numcykle
    NewPop1=selbest(Pop, Fit, [3 1]); % 3 najlepsich a 1 nahodny vyber prvkov
    NewPop2=selrand(Pop, Fit, 26); % nahodne vybrane ostatne chybajuce prvky do poppulacie
    CrossedPop=crossov(NewPop2, 2, 0); % nahodne krizenie 2 parentov
    MutedPopX=mutx(CrossedPop, 0.1, Space); % globalna mutacia
    MutedPopA=muta(MutedPopX, 0.02, [5 5 5 5 5 5 5 5 5]*0.02, Space); % aditivna mutacia
    Pop=[NewPop1; MutedPopA]; % Spojenie najlepsich a zmutovanych jedincov

    Fit=fitness(Pop, A); % znovu vyhodnotenie fitness funkcie 
    [minFitnew,indx]=min(Fit); % najdenie najlepsieho (minimalneho) retazca
    if minFitnew<minFit % porovnanie min. a v pripade potreby zmena min. hodnoty
        minFit=minFitnew;
        minRet=Pop(indx,:);
    end
    grafFit(i)=minFit; % ulozenie minimalnej hodnoty po kazdej generacii (iteracii)
end

matrix=reshape(minRet, [3 3])
invA
minFit

plot(grafFit, 'r');
xlabel('generacie (x)');
ylabel('minimalna fitness (y)');
legend('difference');