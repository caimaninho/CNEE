function [x, Iter, Erro] = Gauss_Seidel(n, A, b, Toler, IterMax)
    % Objetivo: Resolver o sistema Ax = b pelo m´etodo iterativo de
    % Gauss-Seidel
    % Entrada: ordem, matriz, vetor independente, tolerância e número
    % máximo de iterações.
    % Saída: vetor solução, número de iterações e condição de erro.

    % Inicializando x
    x = zeros(n, 1);
    
    % Construção das matrizes para as iterações
    for i = 1:n
        r = 1 / A(i, i);
        for j = 1:n
            if i ~= j
                A(i, j) = A(i, j) * r;
            end
        end
        b(i) = b(i) * r;
        x(i) = b(i);
    end
    
    Iter = 0;
    
    % Iterações de Gauss-Seidel
    while true
        Iter = Iter + 1;
        v = x;
        
        for i = 1:n
            Soma = 0;
            for j = 1:n
                if i ~= j
                    Soma = Soma + A(i, j) * x(j);
                end
            end
            x(i) = b(i) - Soma;
        end
        
        Norma1 = 0;
        Norma2 = 0;
        
        for i = 1:n
            if abs(x(i) - v(i)) > Norma1
                Norma1 = abs(x(i) - v(i));
            end
            if abs(x(i)) > Norma2
                Norma2 = abs(x(i));
            end
        end
        
        DifMax = Norma1 / Norma2;
        
        % Impressão das informações da iteração
        fprintf('Iteração: %d\n', Iter);
        fprintf('x: %s\n', mat2str(x));
        fprintf('DifMax: %f\n', DifMax);
        
        % Teste de convergência
        if DifMax < Toler || Iter >= IterMax
            break;
        end
    end
    
    Erro = DifMax >= Toler;
end
