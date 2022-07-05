n = 20;

I = eye(n);
counts = 30;
s = 20;
X = zeros(1,s);
X1 = zeros(1,s);
avg = 0;
for j = 1:s
    disp(j);
    avg = 0;
    for i1 = 1:counts
    U = zeros(n,n,s);
    V = U;
    for i = 1:j
        U(:,:,i) = randU(n);
        V(:,:,i) = randU(n);
    end

%     a1 = randVect(s)/2;
%     a2 = randVect(s)/2;
    M = zeros(n^2);
%     M1 = zeros(n);
%     M2 = M1;

    for i = 1:j
        M = M + (kron(U(:,:,i),I) + kron(I,V(:,:,i)))/(2*j);
%         M1 = M1 + a1(i)*U(:,:,i);
%         M2 = M2 + a2(i)*U(:,:,i);
    end
    avg = avg + opNorm(M)/counts;

%     op1=opNorm(M1)
%     op2=(opNorm(M2))
    %disp(opNorm(M2)*opNorm(M1));
    end
    X(j) = avg;
    X1(j) = sqrt(2*j-1)/j;
end

figure(2)
plot((X-X1)./X1);

