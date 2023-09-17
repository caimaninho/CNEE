function [x, Iter, Erro] = Jacobi(n, A, b, Toler, IterMax)
    % Objetivo: Resolver sistema Ax = b pelo método de Jacobi
    % Entradas: ordem, matriz, vetor independente,
    % tolerância e número máximo de iterações
    % Saída: vetor solução, número de iterações e condição de erro
    
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
    
    % Iterações de Jacobi
    while true
        Iter = Iter + 1;
        v = zeros(n, 1);
        
        for i = 1:n
            Soma = 0;
            for j = 1:n
                if i ~= j
                    Soma = Soma + A(i, j) * x(j);
                end
            end
            v(i) = b(i) - Soma;
        end
        
        Norma1 = 0;
        Norma2 = 0;
        
        for i = 1:n
            if abs(v(i) - x(i)) > Norma1
                Norma1 = abs(v(i) - x(i));
            end
            if abs(v(i)) > Norma2
                Norma2 = abs(v(i));
            end
            x(i) = v(i);
        end
        
        DifMax = Norma1 / Norma2;
        
        % Imprima as informações da iteração
        fprintf('Iteração: %d\n', Iter);
        fprintf('x: %s\n', mat2str(x));
        fprintf('DifMax: %f\n', DifMax);
        
        % Teste de convergência
        if DifMax < Toler || Iter >= IterMax
            break;
        end
    end
    
    Erro = DifMax >= Toler;
    % Variável lógica: se verdadeiro há erro e se falso não há erro
end
