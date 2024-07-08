clear all; clc;clf;

cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Network2');
load('SC_network');

cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Network2');
load('FC_network_dschg');



cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Data');

%grass

G1=SC_network{1,1};
G2=FC_network{5,1,1};
G3=FC_network{5,2,1};
G4=FC_network{5,3,1};
G5=FC_network{4,1,1};
G6=FC_network{4,2,1};
G7=FC_network{4,3,1};
G8=FC_network{3,1,1};
G9=FC_network{3,2,1};
G10=FC_network{3,3,1};
G11=FC_network{2,1,1};
G12=FC_network{2,2,1};
G13=FC_network{2,3,1};
G14=FC_network{1,1,1};
G15=FC_network{1,2,1};
G16=FC_network{1,3,1};


link_number=[length(G1.Edges.Weight) length(G2.Edges.Weight) length(G3.Edges.Weight) length(G4.Edges.Weight) length(G5.Edges.Weight) length(G6.Edges.Weight) length(G7.Edges.Weight) length(G8.Edges.Weight) length(G9.Edges.Weight) length(G10.Edges.Weight) length(G11.Edges.Weight) length(G12.Edges.Weight) length(G13.Edges.Weight) length(G14.Edges.Weight) length(G15.Edges.Weight) length(G16.Edges.Weight)];

group=[G1.Edges.Weight; G2.Edges.Weight; G3.Edges.Weight; G4.Edges.Weight; G5.Edges.Weight; G6.Edges.Weight; G7.Edges.Weight; G8.Edges.Weight; G9.Edges.Weight; G10.Edges.Weight; G11.Edges.Weight; G12.Edges.Weight; G13.Edges.Weight; G14.Edges.Weight; G15.Edges.Weight; G16.Edges.Weight];

c=[zeros(1,length(G1.Edges.Weight)),ones(1,length(G2.Edges.Weight)),2*ones(1,length(G3.Edges.Weight)),3*ones(1,length(G4.Edges.Weight)),4*ones(1,length(G5.Edges.Weight)),5*ones(1,length(G6.Edges.Weight)),6*ones(1,length(G7.Edges.Weight)),7*ones(1,length(G8.Edges.Weight)),8*ones(1,length(G9.Edges.Weight)),9*ones(1,length(G10.Edges.Weight)),10*ones(1,length(G11.Edges.Weight)),11*ones(1,length(G12.Edges.Weight)),12*ones(1,length(G13.Edges.Weight)),13*ones(1,length(G14.Edges.Weight)),14*ones(1,length(G15.Edges.Weight)),15*ones(1,length(G16.Edges.Weight))];


subaxis(1,1,1,'ML',0.1,'MR',0.08,'MT',0.05,'MB',0.73,'sh',0.0,'sv',0.02);
boxplot(group,c,'Positions',c); hold on
xlim([-1 16])
ylabel('Link Weight')
xticks(0:1:15);
xticklabels({'SC','5','5','5','10','10','10','15','15','15','24','24','24','45','45','45'});
xlabel('rainfall total (mm)')
ylim([-0.2 1.2])
yticks([0:0.5:1]);
legend


yyaxis right         

scatter(0:15,link_number','o','MarkerFaceColor',[0 0.4470 0.7410]);hold on   
ylim([0 1200]);
ylabel('Number of Links')

xlabel('Soil Mositure (%)')
xticklabels({'SC', '3.8','10.5','21.1','3.8','10.5','21.1','3.8','10.5','21.1','3.8','10.5','21.1','3.8','10.5','21.1'});
ax=gca;
ax.XAxisLocation = 'top';
ax.XGrid = 'on';
ylim([-40 1240])
yticks([0:500:1000]);
legend({'Number of Links'});



%%shrub
G1=SC_network{1,2};
G2=FC_network{5,1,2};
G3=FC_network{5,2,2};
G4=FC_network{5,3,2};
G5=FC_network{4,1,2};
G6=FC_network{4,2,2};
G7=FC_network{4,3,2};
G8=FC_network{3,1,2};
G9=FC_network{3,2,2};
G10=FC_network{3,3,2};
G11=FC_network{2,1,2};
G12=FC_network{2,2,2};
G13=FC_network{2,3,2};
G14=FC_network{1,1,2};
G15=FC_network{1,2,2};
G16=FC_network{1,3,2};


link_number=[length(G1.Edges.Weight) length(G2.Edges.Weight) length(G3.Edges.Weight) length(G4.Edges.Weight) length(G5.Edges.Weight) length(G6.Edges.Weight) length(G7.Edges.Weight) length(G8.Edges.Weight) length(G9.Edges.Weight) length(G10.Edges.Weight) length(G11.Edges.Weight) length(G12.Edges.Weight) length(G13.Edges.Weight) length(G14.Edges.Weight) length(G15.Edges.Weight) length(G16.Edges.Weight)];

group=[G1.Edges.Weight; G2.Edges.Weight; G3.Edges.Weight; G4.Edges.Weight; G5.Edges.Weight; G6.Edges.Weight; G7.Edges.Weight; G8.Edges.Weight; G9.Edges.Weight; G10.Edges.Weight; G11.Edges.Weight; G12.Edges.Weight; G13.Edges.Weight; G14.Edges.Weight; G15.Edges.Weight; G16.Edges.Weight];

c=[zeros(1,length(G1.Edges.Weight)),ones(1,length(G2.Edges.Weight)),2*ones(1,length(G3.Edges.Weight)),3*ones(1,length(G4.Edges.Weight)),4*ones(1,length(G5.Edges.Weight)),5*ones(1,length(G6.Edges.Weight)),6*ones(1,length(G7.Edges.Weight)),7*ones(1,length(G8.Edges.Weight)),8*ones(1,length(G9.Edges.Weight)),9*ones(1,length(G10.Edges.Weight)),10*ones(1,length(G11.Edges.Weight)),11*ones(1,length(G12.Edges.Weight)),12*ones(1,length(G13.Edges.Weight)),13*ones(1,length(G14.Edges.Weight)),14*ones(1,length(G15.Edges.Weight)),15*ones(1,length(G16.Edges.Weight))];

 subaxis(4,1,2,'ML',0.1,'MR',0.08,'MT',0.08,'MB',0.08,'sh',0.0,'sv',0.02);
boxplot(group,c,'Positions',c); hold on
xlim([-1 16])
ylabel('Link Weight');
xticklabels({''});
ylim([-0.2 1.2])
yticks([0:0.5:1]);

  yyaxis right
scatter(0:15,link_number','o','MarkerFaceColor',[0 0.4470 0.7410]);hold on   
ylim([0 1200]);
ax=gca;
ax.XGrid = 'on';
ylabel('Number of Links')
ylim([-40 1240])
yticks([0:500:1000]);


cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Network2');
load('FC_network_sedtr');



cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Data');

%grass

G1=SC_network{1,1};
G2=FC_network{5,1,1};
G3=FC_network{5,2,1};
G4=FC_network{5,3,1};
G5=FC_network{4,1,1};
G6=FC_network{4,2,1};
G7=FC_network{4,3,1};
G8=FC_network{3,1,1};
G9=FC_network{3,2,1};
G10=FC_network{3,3,1};
G11=FC_network{2,1,1};
G12=FC_network{2,2,1};
G13=FC_network{2,3,1};
G14=FC_network{1,1,1};
G15=FC_network{1,2,1};
G16=FC_network{1,3,1};

link_number=[length(G1.Edges.Weight) length(G2.Edges.Weight) length(G3.Edges.Weight) length(G4.Edges.Weight) length(G5.Edges.Weight) length(G6.Edges.Weight) length(G7.Edges.Weight) length(G8.Edges.Weight) length(G9.Edges.Weight) length(G10.Edges.Weight) length(G11.Edges.Weight) length(G12.Edges.Weight) length(G13.Edges.Weight) length(G14.Edges.Weight) length(G15.Edges.Weight) length(G16.Edges.Weight)];


group=[G1.Edges.Weight; G2.Edges.Weight; G3.Edges.Weight; G4.Edges.Weight; G5.Edges.Weight; G6.Edges.Weight; G7.Edges.Weight; G8.Edges.Weight; G9.Edges.Weight; G10.Edges.Weight; G11.Edges.Weight; G12.Edges.Weight; G13.Edges.Weight; G14.Edges.Weight; G15.Edges.Weight; G16.Edges.Weight];

c=[zeros(1,length(G1.Edges.Weight)),ones(1,length(G2.Edges.Weight)),2*ones(1,length(G3.Edges.Weight)),3*ones(1,length(G4.Edges.Weight)),4*ones(1,length(G5.Edges.Weight)),5*ones(1,length(G6.Edges.Weight)),6*ones(1,length(G7.Edges.Weight)),7*ones(1,length(G8.Edges.Weight)),8*ones(1,length(G9.Edges.Weight)),9*ones(1,length(G10.Edges.Weight)),10*ones(1,length(G11.Edges.Weight)),11*ones(1,length(G12.Edges.Weight)),12*ones(1,length(G13.Edges.Weight)),13*ones(1,length(G14.Edges.Weight)),14*ones(1,length(G15.Edges.Weight)),15*ones(1,length(G16.Edges.Weight))];

 subaxis(4,1,3,'ML',0.1,'MR',0.08,'MT',0.08,'MB',0.08,'sh',0.0,'sv',0.02);
boxplot(group,c,'Positions',c); hold on
xlim([-1 16])
ylabel('Link Weight');
xticklabels({''});
ylim([-0.2 1.2])
yticks([0:0.5:1]);

  yyaxis right
scatter(0:15,link_number','o','MarkerFaceColor',[0 0.4470 0.7410]);hold on   
ylim([0 1200]);
ax=gca;
ax.XGrid = 'on';   
ylabel('Number of Links')
ylim([-40 1240])
yticks([0:500:1000]);
                      


%%shrub
G1=SC_network{1,2};
G2=FC_network{5,1,2};
G3=FC_network{5,2,2};
G4=FC_network{5,3,2};
G5=FC_network{4,1,2};
G6=FC_network{4,2,2};
G7=FC_network{4,3,2};
G8=FC_network{3,1,2};
G9=FC_network{3,2,2};
G10=FC_network{3,3,2};
G11=FC_network{2,1,2};
G12=FC_network{2,2,1};
G13=FC_network{2,3,2};
G14=FC_network{1,1,2};
G15=FC_network{1,2,2};
G16=FC_network{1,3,2};


link_number=[length(G1.Edges.Weight) length(G2.Edges.Weight) length(G3.Edges.Weight) length(G4.Edges.Weight) length(G5.Edges.Weight) length(G6.Edges.Weight) length(G7.Edges.Weight) length(G8.Edges.Weight) length(G9.Edges.Weight) length(G10.Edges.Weight) length(G11.Edges.Weight) length(G12.Edges.Weight) length(G13.Edges.Weight) length(G14.Edges.Weight) length(G15.Edges.Weight) length(G16.Edges.Weight)];

group=[G1.Edges.Weight; G2.Edges.Weight; G3.Edges.Weight; G4.Edges.Weight; G5.Edges.Weight; G6.Edges.Weight; G7.Edges.Weight; G8.Edges.Weight; G9.Edges.Weight; G10.Edges.Weight; G11.Edges.Weight; G12.Edges.Weight; G13.Edges.Weight; G14.Edges.Weight; G15.Edges.Weight; G16.Edges.Weight];

c=[zeros(1,length(G1.Edges.Weight)),ones(1,length(G2.Edges.Weight)),2*ones(1,length(G3.Edges.Weight)),3*ones(1,length(G4.Edges.Weight)),4*ones(1,length(G5.Edges.Weight)),5*ones(1,length(G6.Edges.Weight)),6*ones(1,length(G7.Edges.Weight)),7*ones(1,length(G8.Edges.Weight)),8*ones(1,length(G9.Edges.Weight)),9*ones(1,length(G10.Edges.Weight)),10*ones(1,length(G11.Edges.Weight)),11*ones(1,length(G12.Edges.Weight)),12*ones(1,length(G13.Edges.Weight)),13*ones(1,length(G14.Edges.Weight)),14*ones(1,length(G15.Edges.Weight)),15*ones(1,length(G16.Edges.Weight))];

 subaxis(4,1,4,'ML',0.1,'MR',0.08,'MT',0.08,'MB',0.08,'sh',0.0,'sv',0.02);
boxplot(group,c,'Positions',c); hold on
xlim([-1 16])
ylabel('Link Weight');
xticklabels({'SC','5','5','5','10','10','10','15','15','15','24','24','24','45','45','45'});
xlabel('Rainfall Total (mm)')
ylim([-0.2 1.2])
yticks([0:0.5:1]);


  yyaxis right
scatter(0:15,link_number','o','MarkerFaceColor',[0 0.4470 0.7410]);hold on   
ylim([0 1200]);
ax=gca;
ax.XGrid = 'on';
ylabel('Number of Links')
ylim([-40 1240])
yticks([0:500:1000]);


subaxis(4,1,1,'ML',0.0499,'MR',0.95,'MT',0.08,'MB',0.08,'sh',0.0,'sv',0.02);
xticklabels({''})
yticklabels({''})
box off
ylabel('a. FC_{hyd} grassland','Color','k');
yticks([]);  

subaxis(4,1,2,'ML',0.0499,'MR',0.95,'MT',0.08,'MB',0.08,'sh',0.0,'sv',0.02);
xticklabels({''})
yticklabels({''})
box off
ylabel('b. FC_{hyd} shrubland','Color','k');
yticks([]);  


subaxis(4,1,3,'ML',0.0499,'MR',0.95,'MT',0.08,'MB',0.08,'sh',0.0,'sv',0.02);
xticklabels({''})
yticklabels({''})
box off
ylabel('c. FC_{sed} grassland','Color','k');
yticks([]);  


subaxis(4,1,4,'ML',0.0499,'MR',0.95,'MT',0.08,'MB',0.08,'sh',0.0,'sv',0.02);
xticklabels({''})
yticklabels({''})
box off
ylabel('d. FC_{sed} shrubland','Color','k');
yticks([]);  


txt = ['left yaxis: box plot of link weights'];
dim = [0.74,0.87,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',11,'FontWeight','Normal','FitBoxToText','on','Color','k','EdgeColor','none')

txt = ['right yaxis: scatter plot of number of links'];
dim = [0.74,0.845,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',11,'FontWeight','Normal','FitBoxToText','on','Color','k','EdgeColor','none')

          

%%
