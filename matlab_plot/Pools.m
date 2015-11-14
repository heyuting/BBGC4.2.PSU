 clear all, close all;
 clc; 
 Dir='/eddy/s0/users/yzh120/Research/BiomeBGC/GitHub/BBGC-SSH/74BBGC/';

 %load sc.annout.ascii
 fannout=fopen([Dir 'outputs/sc.annout.ascii']);
 annout=textscan(fannout,repmat('%f',[1,12]));
 fclose(fannout);
 VegC=annout{2};
 LitrC=annout{3};
 SoilC=annout{4};
 TotalC=annout{5};
 %leafC=annout{7};
 ABVGC=annout{7}+annout{8}+annout{9};
 
 %plot annual output
 subplot(2,2,1);
 figVC=plot(ABVGC,'o');
 title('Aboveground Veg C Pool [kgC/m^2]');
 set(figVC,...
 'LineStyle',':',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0 0.3 0],...
 'MarkerFaceColor',[0 0.4 0],...
 'LineWidth',1,...
 'Color',[0.1 0.3 0.1]);
 set(gca, 'FontSize',22,'FontWeight','bold','XTick',1:3,'XTickLabel',['2008';'2009';'2010']);

 subplot(2,2,2);
 figSC=plot(SoilC,'s');
 title('Soil C Pool [kgC/m^2]');
  set(figSC,...
 'LineStyle','-.',...
 'MarkerSize',4,...
 'MarkerEdgeColor',[0.4 0.4 .2],...
 'MarkerFaceColor',[0.4 0.4 .2],...
 'LineWidth',1,...
 'Color',[0.2 0.2 0.1]);
 set(gca, 'FontSize',22,'FontWeight','bold','XTick',1:3,'XTickLabel',['2008';'2009';'2010']);


 subplot(2,2,3);
 figLC=plot(LitrC,'d');
 hold;
 title('Litter C Pool [kgC/m^2]');
 set(figLC,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0.4 0.4 0],...
 'MarkerFaceColor',[0.4 0.4 0],...
 'LineWidth',1,...
 'Color',[0.2 0.2 0]);
 set(gca, 'FontSize',22,'FontWeight','bold','XTick',1:3,'XTickLabel',['2008';'2009';'2010']);

subplot(2,2,4);
figTC=plot(TotalC,'o');
title('Total C Pool [kgC/m^2]');
 set(figTC,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0 0.3 0],...
 'MarkerFaceColor',[0.2 0.5 0],...
 'LineWidth',1,...
 'Color',[0 0.5 0]);
  set(gca, 'FontSize',22,'FontWeight','bold','XTick',1:3,'XTickLabel',['2008';'2009';'2010']);
