function r = vetor_residuo(A, b, x)
  n = length(b);
  r = zeros(1, n);

  for i = 1:n
    for j = 1:n
      r(i) = b(i) - A(i, j) * x(j);
    end
  end
end
