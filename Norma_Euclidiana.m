function Norma = Norma_Euclidiana(vetor)
%Essa função calcula a norma-2 ou norma euclidiana de um VETOR.
    n = length(vetor); %Encontra o número de elementos do vetor.
    soma = 0;
    for i=1:n
        soma = soma + abs(vetor(i))^2;
    end
    Norma = sqrt(soma);
end

