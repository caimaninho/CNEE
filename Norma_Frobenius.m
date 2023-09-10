function Norma = Norma_Frobenius(X)
%Esse programa calcula a norma de Frobenius de uma MATRIZ mxn.
    [m,n] = size(X);
    soma = 0;
    for i=1:m
        for j=1:n
            soma = soma + X(i,j)^2;
        end
    end
    Norma = sqrt(soma);
end