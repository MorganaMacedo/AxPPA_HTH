W=16;
K=16;
a = randi([0 65535], 1, 10000);
b = randi([0 65535], 1, 10000);
ok=a+b;

for i=1:K
    tic 
    [sAxPPAT] = AxPPA_Trojan(a, b, i, W);
    tAxPPAT(i)=toc; 
    tic 
    [sAxPPA]  = AxPPA(a, b, i, W);
    tAxPPA(i)=toc; 
    tic
    [sLOAT]   = LOA_Trojan(a,b, i, W);
    tsLOAT(i)=toc; 
    tic
    [SLOA]    = LOA(a,b, i, W);
    tLOA(i)=toc; 
    
    
    ssimAxPPAT(1, i) = ssim(sAxPPAT, ok);
    ssimAxPPA(1, i) = ssim(sAxPPA, ok);
    ssimLOAT(1, i) = ssim(sLOAT, ok);
    ssimLOA(1, i) = ssim(SLOA, ok);
    
    er1 = corrcoef(sAxPPAT, ok);
    er2 = corrcoef(sAxPPA, ok);
    er3 = corrcoef(sLOAT, ok);
    er4 = corrcoef(SLOA, ok);
    ncAxPPAT(1, i) = er1(1,2);
    ncAxPPA(1, i) = er2(1,2);
    ncLOAT(1, i) = er3(1,2);
    ncLOA(1, i) = er4(1,2);
    
    mseAxPPAT(1, i) = mse(sAxPPAT, ok);
    mseAxPPA(1, i) = mse(sAxPPA, ok);
    mseLOAT(1, i) = mse(sLOAT, ok);
    mseLOA(1, i) = mse(SLOA, ok);
    
    maeAxPPAT(1, i) = mae(sAxPPAT, ok);
    maeAxPPA(1, i) = mae(sAxPPA, ok);
    maeLOAT(1, i) = mae(sLOAT, ok);
    maeLOA(1, i) = mae(SLOA, ok);

    siize=length(sAxPPAT);
    for j=1:siize
       eeAxPPA  = abs(sAxPPA(1, j) - sAxPPAT(1, j))/sAxPPA(1, j);
       eeLOA     = abs(SLOA(1, j) - sLOAT(1, j))/SLOA(1, j);
    end
    epAxPPA(1, i) = mean(eeAxPPA)*100;
    epLOA(1, i) = mean(eeLOA)*100;
end
%%
figure;
subplot(4, 2, 1); plot(ssimAxPPA,  '-d', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0,0,0], 'Color',[0,0,0]); hold on;
subplot(4, 2, 1); plot(ssimAxPPAT, '--x', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[1,0,0],'MarkerFaceColor',[1,0,0], 'Color',[1,0,0]); hold on;
ylabel('SSIM [#]'); xlabel('K-bits of approximation [#]'); title("(a) SSIM-Quality-Evaluation of AxPPA with HTH Inject"); subplot(4, 2, 1);legend('AxPPA without HTH', 'AxPPA with HTH', 'FontSize', 10);
subplot(4, 2, 2); plot(ssimLOA,  '-d', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[0.4660 0.6740 0.1880],'MarkerFaceColor',[0.4660 0.6740 0.1880], 'Color',[0.4660 0.6740 0.1880]); hold on;
subplot(4, 2, 2); plot(ssimLOAT, '--x', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[0 0 1],'MarkerFaceColor',[0 0 1], 'Color',[0 0 1]); hold on;
ylabel('SSIM [#]'); xlabel('K-bits of approximation [#]'); title("(b) SSIM-Quality-Evaluation of LOA with HTH Inject"); subplot(4, 2, 2);legend('LOA without HTH', 'LOA with HTH', 'FontSize', 10);

subplot(4, 2, 3); plot(ncAxPPA,  '-d', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0,0,0], 'Color',[0,0,0]); hold on;
subplot(4, 2, 3); plot(ncAxPPAT, '--x', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[1,0,0],'MarkerFaceColor',[1,0,0], 'Color',[1,0,0]); hold on;
ylabel('NCC [#]'); xlabel('K-bits of approximation [#]'); title("(c) NCC-Quality-Evaluation of AxPPA with HTH Inject")
subplot(4, 2, 4); plot(ncLOA,  '-d', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[0.4660 0.6740 0.1880],'MarkerFaceColor',[0.4660 0.6740 0.1880], 'Color',[0.4660 0.6740 0.1880]); hold on;
subplot(4, 2, 4); plot(ncLOAT, '--x', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[0 0 1],'MarkerFaceColor',[0 0 1], 'Color',[0 0 1]); hold on;
ylabel('NCC [#]'); xlabel('K-bits of approximation [#]'); title("(d) NCC-Quality-Evaluation of LOA with HTH Inject")

subplot(4, 2, 5); plot(mseAxPPA,  '-d', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0,0,0], 'Color',[0,0,0]); hold on;
subplot(4, 2, 5); plot(mseAxPPAT, '--x', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[1,0,0],'MarkerFaceColor',[1,0,0], 'Color',[1,0,0]); hold on;
ylabel('MSE [#]'); xlabel('K-bits of approximation [#]'); title("(e) MSE-Quality-Evaluation of AxPPA with HTH Inject")
subplot(4, 2, 6); plot(mseLOA,  '-d', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[0.4660 0.6740 0.1880],'MarkerFaceColor',[0.4660 0.6740 0.1880], 'Color',[0.4660 0.6740 0.1880]); hold on;
subplot(4, 2, 6); plot(mseLOAT, '--x', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[0 0 1],'MarkerFaceColor',[0 0 1], 'Color',[0 0 1]); hold on;
ylabel('MSE [#]'); xlabel('K-bits of approximation [#]'); title("(f) MSE-Quality-Evaluation of LOA with HTH Inject")

subplot(4, 2, 7); plot(maeAxPPA,  '-d', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0,0,0], 'Color',[0,0,0]); hold on;
subplot(4, 2, 7); plot(maeAxPPAT, '--x', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[1,0,0],'MarkerFaceColor',[1,0,0], 'Color',[1,0,0]); hold on;
ylabel('MAE [#]'); xlabel('K-bits of approximation [#]'); title("(g) MAE-Quality-Evaluation of AxPPA with HTH Inject")
subplot(4, 2, 8); plot(maeLOA,  '-d', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[0.4660 0.6740 0.1880],'MarkerFaceColor',[0.4660 0.6740 0.1880], 'Color',[0.4660 0.6740 0.1880]); hold on;
subplot(4, 2, 8); plot(maeLOAT, '--x', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[0 0 1],'MarkerFaceColor',[0 0 1], 'Color',[0 0 1]); hold on;
ylabel('MAE [#]'); xlabel('K-bits of approximation [#]'); title("(h) MAE-Quality-Evaluation of LOA with HTH Inject")
%% 
%tempo de execução, diferença em percentual
figure;
tempAxPPA = (abs(tAxPPA - tAxPPAT)./tAxPPA)*100;
tempLOA   = (abs(tLOA - tsLOAT)./tLOA)*100;

plot(tempAxPPA,  '-d', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0,0,0], 'Color',[0,0,0]); hold on;
plot(tempLOA,  '-d', 'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',[0.4660 0.6740 0.1880],'MarkerFaceColor',[0.4660 0.6740 0.1880], 'Color',[0.4660 0.6740 0.1880]); hold on;
ylabel('Error-Probability [%]'); xlabel('K-bits of approximation [#]');
title("Probability between the AxA and AxA with HTH Inject for execution-time");
legend("AxPPA with HTH", 'LOA with HTH', 'FontSize', 10)
