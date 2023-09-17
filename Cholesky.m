function [L, Det, Erro] = Cholesky(n, A)
    % Objetivo: Fazer a decomposição LL' de uma matriz A simétrica e
    % definida positiva.
    % Entrada: ordem e matriz a ser decomposta.
    % Saída: fator, determinate e condição de erro.

    %Inicializando variáveis
    L = zeros(n,n);
    Det = 1;

    for j = 1:n
        Soma = 0;
        for k = 1:j-1
            Soma = Soma + L(j,k)^2;
        end
        t = A(j,j) - Soma;
        Det = Det * t;
        Erro = t <= 0; 
        % Variável lógica: se true tem erro e se false não tem.
        if Erro
            error('A matriz não é definida positiva');
        else
            L(j,j) = sqrt(t);
            r = 1/L(j,j);
        end
        for i = j+1:n
            Soma = 0;
            for k = 1:j-1
                Soma = Soma + L(i,k) * L(j,k);
            end
            L(i,j) = (A(i,j) - Soma) * r;
        end
    end
end
