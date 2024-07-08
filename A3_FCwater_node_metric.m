clear all; clc;
cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Network2');
load('FC_network_dschg');
cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Data');


clf;
colormap('parula(10)');

for st=1:2
    G= FC_network{1,3,st};
    H=rmedge(G,1:height(G.Edges));

    subaxis(2,1,st,'ML',0.024,'MR',0.975,'MT',0.01,'MB',0.01,'sh',0.01,'sv',0.01);
    box on

    xticks('');
    yticks('');
    set(gca,'fontweight','bold','fontsize',11,YColor = 'w');
    box off
    if st==1
        ylabel('FC_{hyd} grassland','fontweight','bold','fontsize',11,'Color','k'); else
        ylabel('FC_{hyd} shrubland','fontweight','bold','fontsize',11,'Color','k');end

    a1= subaxis(2,3,3*st-2,'ML',0.025,'MR',0.58,'MT',0.01,'MB',0.01,'sh',0.064,'sv',0.01);
    p=plot(H,'layout','force3');

    p.XData=G.Nodes.Xdata;
    p.YData=G.Nodes.Ydata;

    view(2)
    daspect([1,1,0.001]);
    box on
    axis on
    xticks('');
    yticks('');
    axis tight

    xlim([0 10]);
    ylim([0 30]);

    Pathways(1:1200,1:1200)=0;


    Pathways(1:1200,1:1200)=0;
    b=[G.Edges.EndNodes G.Edges.Weight];

    for m=1:1200
        a=nearest(G,m,1200);
        c=ismember(b(:,1),[m;a(1:end-1)]);
        Pathways(m,a)=b(c,3);end

    incoming_pathways=sum(Pathways);
    outgoinging_pathways=sum(Pathways');


    % stats(1,st)=max(incoming_pathways);
    % stats(2,st)=min(incoming_pathways);
    % stats(3,st)=mean(incoming_pathways);
    % stats(4,st)=std(incoming_pathways);
    % stats(5,st)=sum(incoming_pathways>=41);
    % stats(6,st)=sum(incoming_pathways<=0);


    p.MarkerSize=5*incoming_pathways/max(incoming_pathways)+0.75;
    p.Marker='s';
    p.NodeCData=incoming_pathways;



    c = colorbar;
    c.Orientation = 'Vertical';
    c.Position = [0.115 0.3 0.022 0.4];
    caxis([0 120])
    c.Ticks = [0:24:120];
    if st==1
        c.Visible='off';end


    view(2);
    c.Label.String = 'a. Weighted Length of Connected Pathways';

    set(gca,'fontweight','bold','fontsize',11);
    set(gca, 'YDir', 'reverse');



    a1= subaxis(2,3,3*st-1,'ML',0.025,'MR',0.58,'MT',0.01,'MB',0.01,'sh',0.064,'sv',0.01);
    p=plot(H,'layout','force3');

    p.XData=G.Nodes.Xdata;
    p.YData=G.Nodes.Ydata;

    view(2)
    daspect([1,1,0.001]);
    box on
    axis on
    xticks('');
    yticks('');
    axis tight

    xlim([0 10]);
    ylim([0 30]);

    p.MarkerSize=5*centrality(G,'betweenness','cost',1./G.Edges.Weight)./max(centrality(G,'betweenness','cost',1./G.Edges.Weight))+0.75;
    p.Marker='s';
    p.NodeCData=centrality(G,'betweenness','cost',1./G.Edges.Weight);
   

    c = colorbar;
    c.Orientation = 'Vertical';
    c.Position = [0.268 0.3 0.022 0.4];
    caxis([0 2000])
    c.Ticks = [0:400:2000];
    if st==1
        c.Visible='off';end


    view(2);
    c.Label.String = 'b. Betweenness Centrality';

    set(gca,'fontweight','bold','fontsize',11);
    set(gca, 'YDir', 'reverse');


    a1= subaxis(2,3,3*st,'ML',0.025,'MR',0.58,'MT',0.01,'MB',0.01,'sh',0.064,'sv',0.01);
    p=plot(H,'layout','force3');

    p.XData=G.Nodes.Xdata;
    p.YData=G.Nodes.Ydata;

    view(2)
    daspect([1,1,0.001]);
    box on
    axis on
    xticks('');
    yticks('');
    axis tight

    xlim([0 10]);
    ylim([0 30]);


    Globalefficiency=mean(centrality(G,'outcloseness','Cost',1./G.Edges.Weight)+centrality(G,'incloseness','Cost',1./G.Edges.Weight));
    for m=1:1200
        H=rmnode(G,m);
        hweight=H.Edges.Weight;
        nodeefficiency(m)=mean(centrality(H,'outcloseness','Cost',1./hweight)+centrality(H,'incloseness','Cost',1./hweight));
    end
    nodeefficiencyf=(Globalefficiency-nodeefficiency)*100/Globalefficiency;

    p.MarkerSize=5*abs(nodeefficiencyf)./max(abs(nodeefficiencyf))+0.75;
    p.Marker='s';
    p.NodeCData=nodeefficiencyf;


    c = colorbar;
    c.Orientation = 'Vertical';
    c.Position = [0.42 0.3 0.022 0.4];
    caxis([-2 10])
    c.Ticks = [-2 4 10];
    if st==1
        c.Visible='off';end

    view(2);
    c.Label.String = 'c. Relative Node Efficiency';

    set(gca,'fontweight','bold','fontsize',11);
    set(gca, 'YDir', 'reverse');
end


for rain=1:5
    for st=1:2

         G= FC_network{rain,3,st};

         Pathways(1:1200,1:1200)=0;
    b=[G.Edges.EndNodes G.Edges.Weight];

    for m=1:1200
        a=nearest(G,m,1200);
        c=ismember(b(:,1),[m;a(1:end-1)]);
        Pathways(m,a)=b(c,3);end

    incoming_pathways=sum(Pathways);
    outgoinging_pathways=sum(Pathways');

    LOCPP(5*st+rain-5,:)=incoming_pathways;

     BC(5*st+rain-5,:)=centrality(G,'betweenness','cost',1./G.Edges.Weight);

        Globalefficiency=mean(centrality(G,'outcloseness','Cost',1./G.Edges.Weight)+centrality(G,'incloseness','Cost',1./G.Edges.Weight));
    for m=1:1200
        H=rmnode(G,m);
        hweight=H.Edges.Weight;
        nodeefficiency(m)=mean(centrality(H,'outcloseness','Cost',1./hweight)+centrality(H,'incloseness','Cost',1./hweight));
    end
    nodeefficiencyf=(Globalefficiency-nodeefficiency)*100/Globalefficiency;

    RNE(5*st+rain-5,:)=nodeefficiencyf;
    class(5*st+rain-5,:)=[((5*st+rain-5)-1)*ones(1,length(LOCPP))];

    end
end


LOCPP= [flip(LOCPP(1:5,:));flip(LOCPP(6:10,:))];
mean_path=mean(LOCPP');
mean_path(mean_path==0)=NaN;

group=LOCPP(:);
class=class(:);


subaxis(3,1,1,'ML',0.525,'MR',0.05,'MT',0.05,'MB',0.05,'sh',0.064,'sv',0.06);
boxplot(group,class,'Positions',class); hold on

ylabel('d. WLOCOP')

xticklabels({'5','10','15','24','45','5','10','15','24','45'});
ylim([0 120])
yticks([0:24:120]);

yyaxis right

scatter(0:9,mean_path','o','MarkerFaceColor',[0 0.4470 0.7410]);hold on
ylabel('Mean(WLOCOP)');
ylim([-0.1 3.5]);
set(gca,'fontweight','bold','fontsize',9);


BC= [flip(BC(1:5,:));flip(BC(6:10,:))];
group=BC(:);
mean_BC=mean(BC');

mean_BC(mean_BC==0)=NaN;


subaxis(3,1,2,'ML',0.525,'MR',0.05,'MT',0.05,'MB',0.05,'sh',0.064,'sv',0.06);
boxplot(group,class,'Positions',class); hold on

ylabel('e. Betweenness Centrality')

xticklabels({'5','10','15','24','45','5','10','15','24','45'});
ylim([0 2000])
yticks([0:400:2000]);

yyaxis right

scatter(0:9,mean_BC','o','MarkerFaceColor',[0 0.4470 0.7410]);hold on
ylabel('Mean(BC)');
ylim([-5 120]);
set(gca,'fontweight','bold','fontsize',9);


RNE= [flip(RNE(1:5,:));flip(RNE(6:10,:))];
mean_RNE=mean(RNE');

group=RNE(:);


subaxis(3,1,3,'ML',0.525,'MR',0.05,'MT',0.05,'MB',0.05,'sh',0.064,'sv',0.06);
boxplot(group,class,'Positions',class); hold on

ylabel('f. Relative Node Efficiency')

xticklabels({'5','10','15','24','45','5','10','15','24','45'});
ylim([-2 10.2])
yticks([-2:6:10]);

yyaxis right

scatter(0:9,mean_RNE','o','MarkerFaceColor',[0 0.4470 0.7410]);hold on
ylabel('Mean(RNE)');
ylim([-0.1 0.3]);

set(gca,'fontweight','bold','fontsize',9);
xlabel('Rainfall (mm)')



txt = ['FC_{hyd} grassland'];
dim = [0.542,0.96,0.175,0.04];
annotation('textbox',dim,'String',txt,'FontSize',11,'FontWeight','Bold','FitBoxToText','off','Color','k','EdgeColor','k','HorizontalAlignment','center')

txt = ['FC_{hyd} shrubland'];
dim = [0.753,0.96,0.175,0.04];
annotation('textbox',dim,'String',txt,'FontSize',11,'FontWeight','Bold','FitBoxToText','off','Color','k','EdgeColor','k','HorizontalAlignment','center')
