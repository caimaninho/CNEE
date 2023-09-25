function [A, det, Pivot] = Decomposicao_LU(n, A)
%Fazer a decomposição LU de uma matriz A.
%Matriz decomposta A=U+L-I.
    Pivot = zeros(n,1);
    for i=1:n
        Pivot(i) = i;
    end
    det = 1;
    for j=1:n-1
        %Escolha do elemento pivô.
        p = j;
        Amax = abs(A(j,j));
        for k=j+1:n
            if abs(A(k,j))>Amax
                Amax = abs(A(k,j));
                p=k;
            end
        end
        if p~=j
            %Troca de linhas.
            for k=1:n
                t = A(j,k);
                A(j,k) = A(p,k);
                A(p,k) = t;
            end
            t = Pivot(j);
            Pivot(j) = Pivot(p);
            Pivot(p) = t;
            det = -det;
        end
        det = det * A(j,j);
        if abs(A(j,j))~=0
            %Eliminação de Gauss.
            r = 1/A(j,j);
            for i=j+1:n
                m = A(i,j) * r;
                A(i,j) = m;
                for k=j+1:n
                    A(i,k) = A(i,k) - m*A(j,k);
                end
            end
        end
    end
    det = det * A(n,n);
end
