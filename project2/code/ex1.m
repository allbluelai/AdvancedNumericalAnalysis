close all;
clear;
clc;

testNum = 100;

cond2 = zeros(testNum,1); % using cond function
cond2_1 = zeros(testNum,1); % using norm(H,2)*norm(invhilb(n),2)
dimension = [1:testNum]';
for n = 1:testNum
    cond2(n) = cond(Hilbert(n),2);
    cond2_1(n) = norm(Hilbert(n),2)*norm(invhilb(n),2);
end

figure(1)
semilogy(dimension, cond2, 'r', 'LineWidth', 2)
xlabel('阶数n')
ylabel('cond2')
title('cond2-dimension对数曲线图(使用cond(H,2))')
saveas(gcf, 'result/logcond2.png')

figure(2)
semilogy(dimension, cond2_1, 'r', 'LineWidth', 2)
xlabel('阶数n')
ylabel('cond2')
title('cond2-dimension对数曲线图(使用norm(H)*norm(inv(H)))')
saveas(gcf, 'result/alogcond2.png')

figure(3)
p = polyfit(dimension, log10(cond2_1), 1);
r = corrcoef(dimension, log10(cond2_1));
x=linspace(1,testNum);  
y=polyval(p,x);
plot(dimension, log10(cond2_1), 'r*', x, y, 'g', 'LineWidth', 2)
axis([1,100,0,160])
xlabel('阶数n')
ylabel('log_{10}(cond2)')
title('对数化cond2与阶数n的拟合曲线:y=1.5257x-2.0758')
saveas(gcf, 'result/cond2fit.png')