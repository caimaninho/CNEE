function Norma = Norma_Infinito(X)
%Essa função calcula o norma infinito de um VETOR ou MATRIZ.
%Vetor: também chamada de norma uniforme ou norma de máxima magnitude.
%Matriz: também chamada norma máxima de linha.
    [m,n] = size(X);
    Norma = 0;
    for i=1:m
        soma = 0;
        for j=1:n
            soma = soma + abs(X(i,j));
        end
        if(soma>Norma)
            Norma = soma;
        end
    end
end