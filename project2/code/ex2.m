close all;
clear;
clc;

testNum = 100;
dimension = 1:testNum;
error_gauss = zeros(testNum,1);
% error_gauss = zeros(testNum);
rho_jacobi = zeros(testNum,1);
for n = 1:testNum
    H=Hilbert(n);
    x=ones(n,1);
    b=H*x;

    %Gauss��ȥ��
%     fprintf(1,'Gauss��ȥ��������:')
    x1=Gauss(H,b);
    error_gauss(n)=norm(x1-x)/norm(x);
    % disp(error1);

    %Jacobi������
    x0 = zeros(n,1);
    [x2,k,rho] = Jacobi(H,b,x0,1e-6);
    error2=norm(x2-x)/norm(x);
    rho_jacobi(n) = rho;
    % disp(error2);disp(k);

    %Gauss

end

figure;
semilogy(dimension, error_gauss, 'g', 'LineWidth', 2)
title('Gauss��ȥ��������')
xlabel('dimension')
ylabel('e_r(B)')

figure;
plot(dimension, rho_jacobi, 'g', 'LineWidth', 2)
title('Jacobi����������װ뾶')
xlabel('dimension')
ylabel('\rho(B)')