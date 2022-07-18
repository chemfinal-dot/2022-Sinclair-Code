N = 50;
k = 12;
X = linspace(1,N,N);
%X = linspace(2,nmax,nmax-2+1);
%Y = zeros(1,nmax-1);
avgtot = 5;
Y = zeros(1,N);
Y1 = zeros(1,N);


for n = 1:N
    disp(n);
    avg = 0;
    for i1 = 1:avgtot
        U = zeros(n,n,k);
        for i = 1:k
            U(:,:,i) = randU(n);
        end
        tot = zeros(n^2);
        for i = 1:k
            M1 = kron(U(:,:,i), ctranspose(U(:,:,i)));
            %M2 = kron(ctranspose(U(:,:,i)),U(:,:,i))*0.5;
            tot = tot + M1;
        end
        tot = (tot + ctranspose(tot))*0.5;
        avg = avg + norm(tot,2)/avgtot;
    end
    Y(n) = avg;
    Y1(n) = sqrt(2*k-1);
end

dY = Y-Y1;
figure(2)
plot(dY./Y1);
fit(transpose(X),transpose(dY), 'power1')
% avg = 0;
% avgA = 0;
% avgB = 0;
% counts = 200;
% A = randU(n);
% B = randU(n);
% for i1 = 1:counts
%     U = randU(n);
%     U1 = randU(n);
%     U2 = randU(n);
%     avg = avg + trace(U*A)*trace(U*B)/counts;
%     avgA = avgA + trace(U1*A)/counts;
%     avgB = avgB + trace(U2*B)/counts;
% end
% disp(avg)
% disp(avgA*avgB)
