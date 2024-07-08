clear all; clc;
cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Network2');
load('SC_network');
cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Data');


clf;
colormap('parula(10)');
for st=1:2
    G= SC_network{1,st};
    H=rmedge(G,1:height(G.Edges));

    subaxis(2,1,st,'ML',0.024,'MR',0.975,'MT',0.01,'MB',0.01,'sh',0.01,'sv',0.01);
    box on

    xticks('');
    yticks('');
    set(gca,'fontweight','bold','fontsize',11,YColor = 'w');
    box off
    if st==1
        ylabel('SC grassland','fontweight','bold','fontsize',11,'Color','k'); else
        ylabel('SC shrubland','fontweight','bold','fontsize',11,'Color','k');end

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

    LOCPP(st,:)=incoming_pathways;


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
    caxis([0 75])
    c.Ticks = [0:15:75];
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
    BC(st,:)=centrality(G,'betweenness','cost',1./G.Edges.Weight);

    c = colorbar;
    c.Orientation = 'Vertical';
    c.Position = [0.268 0.3 0.022 0.4];
    caxis([0 500])
    c.Ticks = [0:100:500];
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

    RNE(st,:)=nodeefficiencyf;



    c = colorbar;
    c.Orientation = 'Vertical';
    c.Position = [0.42 0.3 0.022 0.4];
    caxis([-1.8 1.2])
    c.Ticks = [-1.8:0.6:1.2];
    if st==1
        c.Visible='off';end

    view(2);
    c.Label.String = 'c. Relative Node Efficiency';

    set(gca,'fontweight','bold','fontsize',11);
    set(gca, 'YDir', 'reverse');
end




mean_path=mean(LOCPP');
group=LOCPP;
c=[zeros(1,length(LOCPP)),ones(1,length(LOCPP))];

subaxis(3,1,1,'ML',0.525,'MR',0.25,'MT',0.02,'MB',0.04,'sh',0.064,'sv',0.06);
boxplot(group,c,'Positions',c); hold on

ylabel('d. WLOCOP')

xticklabels({'SC grassland','SC shrubland'});
ylim([0 75])
yticks([0:15:75]);

yyaxis right

scatter(0:1,mean_path','o','MarkerFaceColor',[0 0.4470 0.7410]);hold on
ylabel('Mean(WLOCOP)');
ylim([-0.1 5.1]);
set(gca,'fontweight','bold','fontsize',9);


mean_BC=mean(BC');
group=BC;
c=[zeros(1,length(LOCPP)),ones(1,length(LOCPP))];


subaxis(3,1,2,'ML',0.525,'MR',0.25,'MT',0.02,'MB',0.04,'sh',0.064,'sv',0.06);
boxplot(group,c,'Positions',c); hold on

ylabel('e. Betweenness Centrality')

xticklabels({'SC grassland','SC shrubland'});
ylim([0 500])
yticks([0:100:500]);

yyaxis right

scatter(0:1,mean_BC','o','MarkerFaceColor',[0 0.4470 0.7410]);hold on
ylabel('Mean(BC)');
ylim([-0.1 33.1]);
set(gca,'fontweight','bold','fontsize',9);

mean_RNE=mean(RNE');
group=RNE;
c=[zeros(1,length(LOCPP)),ones(1,length(LOCPP))];


subaxis(3,1,3,'ML',0.525,'MR',0.25,'MT',0.02,'MB',0.04,'sh',0.064,'sv',0.06);
boxplot(group,c,'Positions',c); hold on

ylabel('f. Relative Node Efficiency')

xticklabels({'SC grassland','SC shrubland'});
ylim([-1.8 1.2])
yticks([-1.8:0.6:1.2]);

yyaxis right

scatter(0:1,mean_RNE','o','MarkerFaceColor',[0 0.4470 0.7410]);hold on
ylabel('Mean(RNE)');
ylim([-0.1 0.1]);

set(gca,'fontweight','bold','fontsize',9);


