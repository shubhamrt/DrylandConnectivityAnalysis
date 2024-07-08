clear all; clc;clf;

cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Network2');
load('SC_network');



cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Data');


for st=1:2
    G= SC_network{st};

    figure(1)
    subaxis(1,6,st,'ML',0.001,'MR',0.001,'MT',0.0,'MB',0.025,'sh',0.0,'sv',0.00);
    p=plot(G,'layout','force3');

    p.XData=G.Nodes.Xdata;
    p.YData=G.Nodes.Ydata;

    view(2)
    daspect([1,1,0.001]);
    box off
    axis off
    axis tight


    % colormap(flip(parula))
   a=(brewermap([],"Blues"));
   % colormap(a(33:end,:));



    p.MarkerSize=0.1;
    p.NodeColor='k';

    G.Edges.EdgeColors = G.Edges.Weight;
    p.EdgeCData = G.Edges.EdgeColors;
    p.LineWidth=2.5*(G.Edges.EdgeColors)+0.5;
    p.ArrowSize=6;

    c = colorbar;
    if st==2
        c.Visible='off';end
    c.Orientation = 'Horizontal';
    c.Position = [0.3 0.06 0.4 0.03];
    caxis([0 1])
    c.Ticks = [0:0.2:1];

    view(2);
    c.Label.String = 'Link Weight';
    axis tight


    view(2);

    set(gca,'fontweight','bold','fontsize',12);
    set(gca, 'YDir', 'reverse');
end


txt = ['(a1) SC grassland'];
dim = [0.036,0.94,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

txt = ['(a2) SC shrubland'];
dim = [0.2,0.94,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')



cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Network2');
load('FC_network_dschg');

cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Data');

for st=1:2
    G= FC_network{1,3,st};

    subaxis(1,6,st+2,'ML',0.001,'MR',0.001,'MT',0.0,'MB',0.025,'sh',0.0,'sv',0.00);
    p=plot(G,'layout','force3');

    p.XData=G.Nodes.Xdata;
    p.YData=G.Nodes.Ydata;

    view(2)
    daspect([1,1,0.001]);
    box off
    axis off
    axis tight

    p.MarkerSize=0.1;
    p.NodeColor='k';

    G.Edges.EdgeColors = G.Edges.Weight;
    p.EdgeCData = G.Edges.EdgeColors;
    p.LineWidth=5*(G.Edges.EdgeColors)+0.1;
    p.ArrowSize=6;

    c = colorbar;

        c.Visible='off';
    c.Orientation = 'Horizontal';
    c.Position = [0.03 0.07 0.28 0.024];
    caxis([0 1])

    c.Ticks = [0:0.2:1];

    view(2);
    c.Label.String = 'Link Weight';


    view(2);

    set(gca,'fontweight','bold','fontsize',12);
    set(gca, 'YDir', 'reverse');
end


txt = ['(b1) FC_hyd grassland'];
dim = [0.352,0.94,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

txt = ['(b2) FC_hyd shrubland'];
dim = [0.521,0.94,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

H=FC_network;

cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Network2');
load('FC_network_sedtr');

cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Data');

for st=1:2
    G= FC_network{1,3,st};
   %  I=H{1,3,st};
   % 
   %  NodesG=G.Edges.EndNodes;
   %  NodesI=I.Edges.EndNodes;
   % 
   % IinG= ismember(NodesG(:,1),NodesI(:,1));
   % IinG=find(IinG~=1);
   % 
   %  G= rmedge(G,IinG);


    figure(1)
    subaxis(1,6,st+4,'ML',0.001,'MR',0.001,'MT',0.0,'MB',0.025,'sh',0.0,'sv',0.00);
    p=plot(G,'layout','force3');

    p.XData=G.Nodes.Xdata;
    p.YData=G.Nodes.Ydata;

    view(2)
    daspect([1,1,0.001]);
    box off
    axis off
    axis tight



    p.MarkerSize=0.1;
    p.NodeColor='k';

    G.Edges.EdgeColors = G.Edges.Weight;
    p.EdgeCData = G.Edges.EdgeColors;
    p.LineWidth=5*(G.Edges.EdgeColors)+0.1;
    p.ArrowSize=6;

    c = colorbar;

        c.Visible='off';
    c.Orientation = 'Horizontal';
    c.Position = [0.03 0.07 0.28 0.024];
    caxis([0 1])

    c.Ticks = [0:0.2:1];

    view(2);
    c.Label.String = 'Link Weight';


    view(2);

    set(gca,'fontweight','bold','fontsize',12);
    set(gca, 'YDir', 'reverse');
end


txt = ['(c1) FC_sed grassland'];
dim = [0.676,0.94,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

txt = ['(c2) FC_sed shrubland'];
dim = [0.84,0.94,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')
