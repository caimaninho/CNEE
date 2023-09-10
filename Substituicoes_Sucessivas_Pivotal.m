function x = Substituicoes_Sucessivas_Pivotal(n, L, c, Pivot)
%Resolver sistema triang. inferior.
% Lx=Pc pelas substituições sucessivas, com pivotação parcial.
    x = zeros(n, 1);
    k = Pivot(1);
    x(1) = c(k);
    for i=2:n
        soma = 0;
        for j=1:i-1
            soma = soma + L(i,j)*x(j);
        end
        k = Pivot(i);
        x(i) = c(k) - soma;
    end
end