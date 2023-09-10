function x = Substituicoes_Retroativas(n, U, d)
%Calcula o vetor solução para um sistema triangular inferior.
% n = ordem, L = matriz triang. inf., c = vetor independente.
% x = vetor solução.
    x = zeros(n,1);
    x(n) = d(n)/U(n,n);
    for i=n-1:-1:1
        soma = 0;
        for j=i+1:n
            soma = soma + U(i,j)*x(j);
        end
        x(i) = (d(i) - soma)/U(i,i);
    end
end