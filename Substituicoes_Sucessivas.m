function x = Substituicoes_Sucessivas(n, L, c)
%Calcula o vetor solução para um sistema triangular inferior.
% n = ordem, L = matriz triang. inf., c = vetor independente.
% x = vetor solução.
    x = zeros(n,1);
    x(1) = c(1)/L(1,1);
    for i=1:n
        soma = 0;
        for j=1:i-1
            soma = soma + L(i,j)*x(j);
        end
        x(i) = (c(i) - soma)/L(i,i);
    end
end