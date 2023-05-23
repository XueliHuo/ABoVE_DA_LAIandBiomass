clear all
%% Figure (a)
tleaf=[5 15 25]';
maxiquantum=[0.1321 0.2173 0.3161]';
figure()
scatter(tleaf,maxiquantum,1000,'o','MarkerFaceColor','c','MarkerFaceAlpha',0.4,'MarkerEdgeColor','b'); hold on
plot(tleaf,0.083833+0.0092.*tleaf,'r','LineWidth',5); hold on
scatter(tleaf,maxiquantum,'x','k'); hold on
grid on
set(gca,'Xlim',[3 27],'FontSize',40);
xlabel('Leaf temperature (^oC)','FontSize',36,'FontWeight','Bold');
ylabel("maximum quantum yield (mol CO^2 mol^-^1)",'FontSize',36,'FontWeight','Bold');
%ylabel("maximum quantum yield of electron transport (mol CO^2 mol^-^1)",'FontSize',26,'FontWeight','Bold');
%ylabel("\Phi_E_T_,_a (mol CO^2 mol^-^1 absorbed quanta)",'FontSize',26,'FontWeight','Bold');
set(gca,'Position',[0.13 0.15 0.84 0.79])
set(gcf,'Position',[1943 -83 1055 764])
text(3.5,0.33,'y=0.083833+0.0092x','Color',[0 0.6 0],'FontSize',65);
text(3.5,0.362,'(a)','FontSize',50,'FontWeight','Bold');

%% Figure (b)
tleaf=[5 15 25]';
curvature=[0.44 0.5 0.65]';
x=5:0.5:25;
%0.0004.*(tleaf.^2)-0.003.*tleaf+0.4437
%% Final plot without the confidence interval
figure()
scatter(tleaf,curvature,1000,'o','MarkerFaceColor',[0.9290 0.6940 0.1250],'MarkerFaceAlpha',0.4,'MarkerEdgeColor','r'); hold on
plot(x,0.0004.*(x.^2)-0.003.*x+0.4437,'Color',[0 0.4470 0.7410],'LineStyle',':','LineWidth',4); hold on
scatter(tleaf,curvature,'x','k'); hold on
grid on
set(gca,'Xlim',[3 27],'Ylim',[0.35 0.7],'FontSize',40);
xlabel('Leaf temperature (^oC)','FontSize',36,'FontWeight','Bold');
ylabel("Curvature",'FontSize',36,'FontWeight','Bold');
%ylabel("maximum quantum yield of electron transport (mol CO^2 mol^-^1)",'FontSize',26,'FontWeight','Bold');
%ylabel("\Phi_E_T_,_a (mol CO^2 mol^-^1 absorbed quanta)",'FontSize',26,'FontWeight','Bold');
set(gca,'Position',[0.13 0.15 0.84 0.78])
set(gcf,'Position',[1943 -83 1055 764])
text(3.5,0.68,"y=0.0004x^2-0.003x+0.4437",'Color',[0 0.6 0],'FontSize',65);
text(3.5,0.716,'(b)','FontSize',50,'FontWeight','Bold');