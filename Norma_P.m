function Norma = Norma_P(p,vetor)
%Essa função calcula a norma-p de um VETOR.
    n = length(vetor); %Encontra o número de elementos do vetor.
    soma = 0;
    for i=1:n
        soma = soma + abs(vetor(i))^p;
    end
    Norma = nthroot(soma,p);
end