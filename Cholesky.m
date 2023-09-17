function [L, Det, Erro] = Cholesky(n, A)
    L = zeros(n,n);
    Det = 1;
    Erro = false;
    for j = 1:n
        Soma = 0;
        for k = 1:j-1
            Soma = Soma + L(j,k)^2;
        end
        t = A(j,j) - Soma;
        Det = Det * t;
        if t <= 0
            Erro = true;
            disp('A matriz não é definida positiva');
            return;
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