clear all; clc;clf;

cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Network2');
load('SC_network');

for st=1:2
    G= SC_network{st};
    Zelev=G.Nodes.Zdata;
    for i=1:1200
        Zmicro(st,i)=Zelev(i)-mean(Zelev(1+20*(floor((i-1)/20)):20+20*(floor((i-1)/20))));
    end
end

cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Data');
for sub = 1:2
    for part = 1:3
        for st=1:2
            G=SC_network{st};
            degree=centrality(G,"indegree",'importance',G.Edges.Weight)+centrality(G,"outdegree",'importance',G.Edges.Weight);
            if isempty(G.Edges)
                CD(sub,part,st)=NaN;
                AC_veg(sub,part,st)=NaN;
                AC_micro(sub,part,st)=NaN;
                GE(sub,part,st)=NaN;else

                if sub==1

                    CD(sub,part,st,:)= sum(max(degree)-degree)/(1199*1998);else
                    CD(sub,part,st)= sum(max(degree(part+400-399:part*400))-degree(part+400-399:part*400))/(399*388);end


                if st==1
                    [VA VB VC]=ascread1('p1vegcover.asc');end

                if st==2
                    [VA VB VC]=ascread1('p4vegcover.asc');end


                Z=VC(2:61,2:21);
                E=Z';
                ZData=E(:);
                Edge=G.Edges.EndNodes;



                if sub==1

                    AC_veg(sub,part,st)=corr(ZData(Edge(:,1)),ZData(Edge(:,2)));
                    AC_micro(sub,part,st)=corr(Zmicro(Edge(:,1)),Zmicro(Edge(:,2)));

                else
                    AC_veg(sub,part,st)=corr(ZData(Edge(G.Edges(:,1).EndNodes(:,2)<=part*400 & G.Edges(:,1).EndNodes(:,2)>(part-1)*400,1)),ZData(Edge(G.Edges(:,1).EndNodes(:,2)<=part*400 & G.Edges(:,1).EndNodes(:,2)>(part-1)*400,2)));
                    AC_micro(sub,part,st)=corr(Zmicro(Edge(G.Edges(:,1).EndNodes(:,2)<=part*400 & G.Edges(:,1).EndNodes(:,2)>(part-1)*400,1)),Zmicro(Edge(G.Edges(:,1).EndNodes(:,2)<=part*400 & G.Edges(:,1).EndNodes(:,2)>(part-1)*400,2)));end


                weight=G.Edges.Weight;



                if sub==1
                    GE(sub,part,st)=mean(centrality(G,'outcloseness','Cost',1./weight)+centrality(G,'incloseness','Cost',1./weight));else

                    if part ==1
                        H=rmnode(G,401:1200); end
                    if part ==2
                        H=rmnode(G,[1:400 801 1200]); end
                    if part ==3
                        H=rmnode(G,1:800); end

                    GE(sub,part,st)=mean(centrality(H,'outcloseness','Cost',1./H.Edges.Weight)+centrality(H,'incloseness','Cost',1./H.Edges.Weight));
                end
            end
        end
    end
end


for st = 1:2
    subaxis(1,8,st,'ML',0.05,'MR',0.01,'MT',0.06,'MB',0.86,'sh',0.01,'sv',0.01);
    imagesc(squeeze(CD(:,:,st)));hold on
    plot([0.4 3.6],[1.5 1.5],'k--'); hold on
    plot([1.5 1.5],[1.5 2.5],'k--'); hold on
    plot([2.5 2.5],[1.5 2.5],'k--'); hold on
    xlim([0.5 3.5]);

    daspect([0.5,1,1]);
    clim([0 0.02]);
    set(gca,'fontweight','bold','fontsize',9);

    xticks(1:3);
    yticks(1:2);
    if st==2
        yticklabels({''});
        title('b. CD SC shrub','fontweight','bold','fontsize',9);
    else
        yticklabels({'plot','regions'});
        title('a. CD SC grass','fontweight','bold','fontsize',9);
    end
    xticklabels({'up','mid','down'});



    subaxis(1,8,st+2,'ML',0.05,'MR',0.01,'MT',0.06,'MB',0.86,'sh',0.01,'sv',0.01);
    imagesc(squeeze(GE(:,:,st)));hold on
    plot([0.4 3.6],[1.5 1.5],'k--'); hold on
    plot([1.5 1.5],[1.5 2.5],'k--'); hold on
    plot([2.5 2.5],[1.5 2.5],'k--'); hold on
    xlim([0.5 3.5]);

    daspect([0.5,1,1]);
    clim([0 1.32*10^-5]);
    set(gca,'fontweight','bold','fontsize',9);

    xticks(1:3);
    yticks(1:2);
    yticklabels({''});
    if st==2
        title('d. GE SC grass','fontweight','bold','fontsize',9);
    else

        title('c. GE SC shrub','fontweight','bold','fontsize',9);
    end
    xticklabels({'up','mid','down'});


    subaxis(1,8,st+4,'ML',0.05,'MR',0.01,'MT',0.06,'MB',0.86,'sh',0.01,'sv',0.01);
    imagesc(squeeze(AC_veg(:,:,st)));hold on
    plot([0.4 3.6],[1.5 1.5],'k--'); hold on
    plot([1.5 1.5],[1.5 2.5],'k--'); hold on
    plot([2.5 2.5],[1.5 2.5],'k--'); hold on
    xlim([0.5 3.5]);

    daspect([0.5,1,1]);
    clim([-0.4 0.4]);
    set(gca,'fontweight','bold','fontsize',9);

    xticks(1:3);
    yticks(1:2);
    yticklabels({''});
    if st==2
        title('f. AC-veg SC grass','fontweight','bold','fontsize',9);
    else

        title('e. AC-veg SC shrub','fontweight','bold','fontsize',9);
    end
    xticklabels({'up','mid','down'});

    subaxis(1,8,st+6,'ML',0.05,'MR',0.01,'MT',0.06,'MB',0.86,'sh',0.01,'sv',0.01);
    imagesc(squeeze(AC_micro(:,:,st)));hold on
    plot([0.4 3.6],[1.5 1.5],'k--'); hold on
    plot([1.5 1.5],[1.5 2.5],'k--'); hold on
    plot([2.5 2.5],[1.5 2.5],'k--'); hold on
    xlim([0.5 3.5]);

    daspect([0.5,1,1]);
    clim([-0.8 0.4]);
    set(gca,'fontweight','bold','fontsize',9);

    xticks(1:3);
    yticks(1:2);
    yticklabels({''});
    if st==2
        title('h. AC-topo SC grass','fontweight','bold','fontsize',9);
    else

        title('g. AC-topo SC shrub','fontweight','bold','fontsize',9);
    end
    xticklabels({'up','mid','down'});
end

%%
cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Network2');
load('FC_network_dschg');

cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Data');
for sub = 1:2
    for part = 1:3
        for rain=1:5
            for sm=1:3
                for st=1:2
                    G=FC_network{rain,sm,st};
                     degree=centrality(G,"indegree",'importance',G.Edges.Weight)+centrality(G,"outdegree",'importance',G.Edges.Weight);
         
                    if isempty(G.Edges)
                        CD(2*rain+sub-2,3*sm-3+part,st)=NaN;
                        AC_veg(2*rain+sub-2,3*sm-3+part,st)=NaN;
                        AC_micro(2*rain+sub-2,3*sm-3+part,st)=NaN;
                        GE(2*rain+sub-2,3*sm-3+part,st)=NaN;else

                        if sub==1
                            CD(2*rain+sub-2,3*sm-3+part,st)= sum(max(degree)-degree)/(1199*1998);else
                            CD(2*rain+sub-2,3*sm-3+part,st)= sum(max(degree(part+400-399:part*400))-degree(part+400-399:part*400))/(399*388);end

                        if st==1
                            [VA VB VC]=ascread1('p1vegcover.asc');end

                        if st==2
                            [VA VB VC]=ascread1('p4vegcover.asc');end

                        Z=VC(2:61,2:21);
                        E=Z';
                        ZData=E(:);
                        Edge=G.Edges.EndNodes;

                        if sub==1

                            AC_veg(2*rain+sub-2,3*sm-3+part,st)=corr(ZData(Edge(:,1)),ZData(Edge(:,2)));
                            AC_micro(2*rain+sub-2,3*sm-3+part,st)=corr(Zmicro(Edge(:,1)),Zmicro(Edge(:,2)));

                        elseif isempty(Edge(G.Edges(:,1).EndNodes(:,2)<=part*400 & G.Edges(:,1).EndNodes(:,2)>(part-1)*400,1))
                            AC_veg(2*rain+sub-2,3*sm-3+part,st)=nan;
                            AC_micro(2*rain+sub-2,3*sm-3+part,st)=nan;
                        else
                            AC_veg(2*rain+sub-2,3*sm-3+part,st)=corr(ZData(Edge(G.Edges(:,1).EndNodes(:,2)<=part*400 & G.Edges(:,1).EndNodes(:,2)>(part-1)*400,1)),ZData(Edge(G.Edges(:,1).EndNodes(:,2)<=part*400 & G.Edges(:,1).EndNodes(:,2)>(part-1)*400,2)));
                            AC_micro(2*rain+sub-2,3*sm-3+part,st)=corr(Zmicro(Edge(G.Edges(:,1).EndNodes(:,2)<=part*400 & G.Edges(:,1).EndNodes(:,2)>(part-1)*400,1)),Zmicro(Edge(G.Edges(:,1).EndNodes(:,2)<=part*400 & G.Edges(:,1).EndNodes(:,2)>(part-1)*400,2)));end


                        weight=G.Edges.Weight;

                        if sub==1
                            GE(2*rain+sub-2,3*sm-3+part,st)=3*mean(centrality(G,'outcloseness','Cost',1./weight)+centrality(G,'incloseness','Cost',1./weight));
                        else

                            if part ==1
                                H=rmnode(G,401:1200); end
                            if part ==2
                                H=rmnode(G,[1:400 801 1200]); end
                            if part ==3
                                H=rmnode(G,1:800); end

                            GE(2*rain+sub-2,3*sm-3+part,st)=4*mean(centrality(H,'outcloseness','Cost',1./H.Edges.Weight)+centrality(H,'incloseness','Cost',1./H.Edges.Weight));
                        end
                    end
                end
            end
        end
    end
end

CD(2,[1 4 7],1)=nan;
CD(4,5,1)=nan;
CD(6,[4 7],2)=nan;
GE(6,[4 7],2)=nan;
GE(4,5,1)=nan;
GE(GE==0)=nan;
CD(CD==0)=nan;
% AC_micro(4,5,1)=mean([AC_micro(4,6,1) AC_micro(3,6,1)]);
% AC_veg(4,5,1)=mean([AC_veg(4,6,1) AC_veg(3,6,1)]);
% AC_micro(4,1,2)=-0.4611;
% AC_veg(4,1,2)=-0.12;
% AC_micro(6,4,2)=-0.4511;
% AC_veg(6,4,2)=-0.0401;
% AC_micro(6,7,2)=-0.4511;
% AC_veg(6,7,2)=-0.0393;

figure(1)

for st = 1:2
    subaxis(1,8,st,'ML',0.05,'MR',0.01,'MT',0.2,'MB',0.5,'sh',0.01,'sv',0.0);
    h= imagesc(squeeze(CD(:,:,st)));hold on
    set(h, 'AlphaData', 1-isnan(squeeze(CD(:,:,st))))

    daspect([1,1,1]);
    clim([0 0.02]);
    set(gca,'fontweight','bold','fontsize',9);
    yticks(1.5:2:9.5);
    xticks(2:3:8);
    if st==2
        yticklabels({''});
        title('j. CD FC_{hyd} shrub','fontweight','bold','fontsize',9);
    else
        yticklabels({'45','24','15','10','5'});
        ylabel('Rainfall (mm)')
        title('i. CD FC_{hyd} grass','fontweight','bold','fontsize',9);end
    xlabel('Soil Moisture (%)');
    xticklabels({'3.8','10.5','21.1'});
    plot([0.4 9.6],[2.5 2.5],'k-'); hold on
    plot([0.4 9.6],[4.5 4.5],'k-'); hold on
    plot([0.4 9.6],[6.5 6.5],'k-'); hold on
    plot([0.4 9.6],[8.5 8.5],'k-'); hold on

    plot([3.5 3.5],[0.5 10.5],'k-'); hold on
    plot([6.5 6.5],[0.5 10.5],'k-'); hold on

    plot([0.4 10.6],[1.5 1.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[3.5 3.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[5.5 5.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[7.5 7.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[9.5 9.5],'k--','linewidth',0.1); hold on


    plot([1.5 1.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[1.5 2.5],'k--','linewidth',0.1); hold on


    plot([1.5 1.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[3.5 4.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[5.5 6.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[7.5 8.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[9.5 10.5],'k--','linewidth',0.1); hold on

    ylim([0.5 10.5])
    xlim([0.5 9.5])

    subaxis(1,8,st+2,'ML',0.05,'MR',0.01,'MT',0.2,'MB',0.5,'sh',0.01,'sv',0.0);
    h=  imagesc(squeeze(GE(:,:,st)));hold on

    set(h, 'AlphaData', 1-isnan(squeeze(GE(:,:,st))))
    daspect([1,1,1]);
    clim([0 1.32*10^-5]);
    set(gca,'fontweight','bold','fontsize',9);
    yticks(1.5:2:9.5);
    xticks(2:3:8);
    yticklabels({''});
    if st==2

        title('l. 4 x GE FC_{hyd} shrub','fontweight','bold','fontsize',9);
    else
        title('k. 4 x GE FC_{hyd} grass','fontweight','bold','fontsize',9);end
    xlabel('Soil Moisture (%)');
    xticklabels({'3.8','10.5','21.1'});
    plot([0.4 9.6],[2.5 2.5],'k-'); hold on
    plot([0.4 9.6],[4.5 4.5],'k-'); hold on
    plot([0.4 9.6],[6.5 6.5],'k-'); hold on
    plot([0.4 9.6],[8.5 8.5],'k-'); hold on

    plot([3.5 3.5],[0.5 10.5],'k-'); hold on
    plot([6.5 6.5],[0.5 10.5],'k-'); hold on

    plot([0.4 10.6],[1.5 1.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[3.5 3.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[5.5 5.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[7.5 7.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[9.5 9.5],'k--','linewidth',0.1); hold on


    plot([1.5 1.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[1.5 2.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[3.5 4.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[5.5 6.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[7.5 8.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[9.5 10.5],'k--','linewidth',0.1); hold on

    ylim([0.5 10.5])
    xlim([0.5 9.5])

    subaxis(1,8,st+4,'ML',0.05,'MR',0.01,'MT',0.2,'MB',0.5,'sh',0.01,'sv',0.0);
    h=  imagesc(squeeze(AC_veg(:,:,st)));hold on

    set(h, 'AlphaData', 1-isnan(squeeze(AC_veg(:,:,st))))
    daspect([1,1,1]);
    clim([-0.4 0.4]);
    set(gca,'fontweight','bold','fontsize',9);
    yticks(1.5:2:9.5);
    xticks(2:3:8);
    yticklabels({''});
    if st==2

        title('n. AC-veg FC_{hyd} shrub','fontweight','bold','fontsize',9);
    else
        title('m. AC-veg FC_{hyd} grass','fontweight','bold','fontsize',9);end
    xlabel('Soil Moisture (%)');
    xticklabels({'3.8','10.5','21.1'});
    plot([0.4 9.6],[2.5 2.5],'k-'); hold on
    plot([0.4 9.6],[4.5 4.5],'k-'); hold on
    plot([0.4 9.6],[6.5 6.5],'k-'); hold on
    plot([0.4 9.6],[8.5 8.5],'k-'); hold on

    plot([3.5 3.5],[0.5 10.5],'k-'); hold on
    plot([6.5 6.5],[0.5 10.5],'k-'); hold on

    plot([0.4 10.6],[1.5 1.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[3.5 3.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[5.5 5.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[7.5 7.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[9.5 9.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[1.5 2.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[3.5 4.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[5.5 6.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[7.5 8.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[9.5 10.5],'k--','linewidth',0.1); hold on

    ylim([0.5 10.5])
    xlim([0.5 9.5])


    subaxis(1,8,st+6,'ML',0.05,'MR',0.01,'MT',0.2,'MB',0.5,'sh',0.01,'sv',0.0);
    h=  imagesc(squeeze(AC_micro(:,:,st)));hold on

    set(h, 'AlphaData', 1-isnan(squeeze(AC_micro(:,:,st))))
    daspect([1,1,1]);
    clim([-0.8 0.4]);
    set(gca,'fontweight','bold','fontsize',9);
    yticks(1.5:2:9.5);
    xticks(2:3:8);
    yticklabels({''});
    if st==2
        title('p. AC-topo FC_{hyd} shrub','fontweight','bold','fontsize',9);
    else
        title('o. AC-topo FC_{hyd} grass','fontweight','bold','fontsize',9);end
    xlabel('Soil Moisture (%)');
    xticklabels({'3.8','10.5','21.1'});
    plot([0.4 9.6],[2.5 2.5],'k-'); hold on
    plot([0.4 9.6],[4.5 4.5],'k-'); hold on
    plot([0.4 9.6],[6.5 6.5],'k-'); hold on
    plot([0.4 9.6],[8.5 8.5],'k-'); hold on

    plot([3.5 3.5],[0.5 10.5],'k-'); hold on
    plot([6.5 6.5],[0.5 10.5],'k-'); hold on

    plot([0.4 10.6],[1.5 1.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[3.5 3.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[5.5 5.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[7.5 7.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[9.5 9.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[1.5 2.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[3.5 4.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[5.5 6.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[7.5 8.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[9.5 10.5],'k--','linewidth',0.1); hold on

    ylim([0.5 10.5])
    xlim([0.5 9.5])
end


cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Network2');
load('FC_network_sedtr');

cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Data');
for sub = 1:2
    for part = 1:3
        for rain=1:5
            for sm=1:3
                for st=1:2
                    G=FC_network{rain,sm,st};
                     degree=centrality(G,"indegree",'importance',G.Edges.Weight)+centrality(G,"outdegree",'importance',G.Edges.Weight);
         
                    if isempty(G.Edges)
                        CD(2*rain+sub-2,3*sm-3+part,st)=NaN;
                        AC_veg(2*rain+sub-2,3*sm-3+part,st)=NaN;
                        AC_micro(2*rain+sub-2,3*sm-3+part,st)=NaN;
                        GE(2*rain+sub-2,3*sm-3+part,st)=NaN;else

                        if sub==1
                            CD(2*rain+sub-2,3*sm-3+part,st)= sum(max(degree)-degree)/(1199*1998);else
                            CD(2*rain+sub-2,3*sm-3+part,st)= sum(max(degree(part+400-399:part*400))-degree(part+400-399:part*400))/(399*388);end

                        if st==1
                            [VA VB VC]=ascread1('p1vegcover.asc');end

                        if st==2
                            [VA VB VC]=ascread1('p4vegcover.asc');end

                        Z=VC(2:61,2:21);
                        E=Z';
                        ZData=E(:);
                        Edge=G.Edges.EndNodes;

                        if sub==1

                            AC_veg(2*rain+sub-2,3*sm-3+part,st)=corr(ZData(Edge(:,1)),ZData(Edge(:,2)));
                            AC_micro(2*rain+sub-2,3*sm-3+part,st)=corr(Zmicro(Edge(:,1)),Zmicro(Edge(:,2)));

                        elseif isempty(Edge(G.Edges(:,1).EndNodes(:,2)<=part*400 & G.Edges(:,1).EndNodes(:,2)>(part-1)*400,1))
                            AC_veg(2*rain+sub-2,3*sm-3+part,st)=nan;
                            AC_micro(2*rain+sub-2,3*sm-3+part,st)=nan;
                        else
                            AC_veg(2*rain+sub-2,3*sm-3+part,st)=corr(ZData(Edge(G.Edges(:,1).EndNodes(:,2)<=part*400 & G.Edges(:,1).EndNodes(:,2)>(part-1)*400,1)),ZData(Edge(G.Edges(:,1).EndNodes(:,2)<=part*400 & G.Edges(:,1).EndNodes(:,2)>(part-1)*400,2)));
                            AC_micro(2*rain+sub-2,3*sm-3+part,st)=corr(Zmicro(Edge(G.Edges(:,1).EndNodes(:,2)<=part*400 & G.Edges(:,1).EndNodes(:,2)>(part-1)*400,1)),Zmicro(Edge(G.Edges(:,1).EndNodes(:,2)<=part*400 & G.Edges(:,1).EndNodes(:,2)>(part-1)*400,2)));end


                        weight=G.Edges.Weight;

                        if sub==1
                            GE(2*rain+sub-2,3*sm-3+part,st)=3*mean(centrality(G,'outcloseness','Cost',1./weight)+centrality(G,'incloseness','Cost',1./weight));
                        else

                            if part ==1
                                H=rmnode(G,401:1200); end
                            if part ==2
                                H=rmnode(G,[1:400 801 1200]); end
                            if part ==3
                                H=rmnode(G,1:800); end

                            GE(2*rain+sub-2,3*sm-3+part,st)=3*mean(centrality(H,'outcloseness','Cost',1./H.Edges.Weight)+centrality(H,'incloseness','Cost',1./H.Edges.Weight));
                        end
                    end
                end
            end
        end
    end
end

GE(10,1:2,1)=nan;
CD(10,1:2,1)=nan;
% AC_micro(4,5,1)=mean([AC_micro(4,6,1) AC_micro(3,6,1)]);
% AC_veg(4,5,1)=mean([AC_veg(4,6,1) AC_veg(3,6,1)]);
% AC_micro(4,1,2)=-0.4611;
% AC_veg(4,1,2)=-0.12;
% AC_micro(6,4,2)=-0.4511;
% AC_veg(6,4,2)=-0.0401;
% AC_micro(6,7,2)=-0.4511;
% AC_veg(6,7,2)=-0.0393;

figure(1)
for st = 1:2
    subaxis(1,8,st,'ML',0.05,'MR',0.01,'MT',0.56,'MB',0.14,'sh',0.01,'sv',0.0);
    h=imagesc(squeeze(CD(:,:,st)));hold on
    set(h, 'AlphaData', 1-isnan(squeeze(CD(:,:,st))))
    daspect([1,1,1]);
    clim([0 0.02]);
    set(gca,'fontweight','bold','fontsize',9);
    yticks(1.5:2:9.5);
    xticks(2:3:8);
    if st==2
        yticklabels({''});
        title('r. CD FC_{sed} shrub','fontweight','bold','fontsize',9);
    else
        yticklabels({'45','24','15','10','5'});
        ylabel('Rainfall (mm)')
        title('q. CD FC_{sed} grass','fontweight','bold','fontsize',9);end
    xlabel('Soil Moisture (%)');
    xticklabels({'3.8','10.5','21.1'});
    plot([0.4 9.6],[2.5 2.5],'k-'); hold on
    plot([0.4 9.6],[4.5 4.5],'k-'); hold on
    plot([0.4 9.6],[6.5 6.5],'k-'); hold on
    plot([0.4 9.6],[8.5 8.5],'k-'); hold on

    plot([3.5 3.5],[0.5 10.5],'k-'); hold on
    plot([6.5 6.5],[0.5 10.5],'k-'); hold on

    plot([0.4 10.6],[1.5 1.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[3.5 3.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[5.5 5.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[7.5 7.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[9.5 9.5],'k--','linewidth',0.1); hold on


    plot([1.5 1.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[1.5 2.5],'k--','linewidth',0.1); hold on


    plot([1.5 1.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[3.5 4.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[5.5 6.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[7.5 8.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[9.5 10.5],'k--','linewidth',0.1); hold on

    ylim([0.5 10.5])
    xlim([0.5 9.5])

    c=colorbar;
    c.Orientation = 'Horizontal';
    c.Position = [0.07 0.06 0.19 0.024];
    clim([0 0.02]);
    c.Ticks =0:0.004:0.02;
    view(2);
    c.Label.String = 'Centralisation Degree (CD)';
    c.FontSize= 9;

    subaxis(1,8,st+2,'ML',0.05,'MR',0.01,'MT',0.56,'MB',0.14,'sh',0.01,'sv',0.0);
    h=  imagesc(squeeze(GE(:,:,st)));hold on

    set(h, 'AlphaData', 1-isnan(squeeze(GE(:,:,st))))
    daspect([1,1,1]);
    clim([0 1.32*10^-5]);
    set(gca,'fontweight','bold','fontsize',9);
    yticks(1.5:2:9.5);
    xticks(2:3:8);
    yticklabels({''});
    if st==2

        title('t. 3 x GE FC_{sed} shrub','fontweight','bold','fontsize',9);
    else
        title('s. 3 x GE FC_{sed} grass','fontweight','bold','fontsize',9);end
    xlabel('Soil Moisture (%)');
    xticklabels({'3.8','10.5','21.1'});
    plot([0.4 9.6],[2.5 2.5],'k-'); hold on
    plot([0.4 9.6],[4.5 4.5],'k-'); hold on
    plot([0.4 9.6],[6.5 6.5],'k-'); hold on
    plot([0.4 9.6],[8.5 8.5],'k-'); hold on

    plot([3.5 3.5],[0.5 10.5],'k-'); hold on
    plot([6.5 6.5],[0.5 10.5],'k-'); hold on

    plot([0.4 10.6],[1.5 1.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[3.5 3.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[5.5 5.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[7.5 7.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[9.5 9.5],'k--','linewidth',0.1); hold on


    plot([1.5 1.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[1.5 2.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[3.5 4.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[5.5 6.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[7.5 8.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[9.5 10.5],'k--','linewidth',0.1); hold on

    ylim([0.5 10.5])
    xlim([0.5 9.5])

    c=colorbar;
    c.Orientation = 'Horizontal';
    c.Position = [0.302 0.06 0.19 0.024];
    clim([0 1.32*10^-5]);
    c.Ticks =0:0.33*10^-5 :1.32*10^-5;
    view(2);
    c.Label.String = 'Global Efficiency (GE)';
    c.FontSize= 9;

    subaxis(1,8,st+4,'ML',0.05,'MR',0.01,'MT',0.56,'MB',0.14,'sh',0.01,'sv',0.0);
    h=  imagesc(squeeze(AC_veg(:,:,st)));hold on

    set(h, 'AlphaData', 1-isnan(squeeze(AC_veg(:,:,st))))
    daspect([1,1,1]);
    clim([-0.4 0.4]);
    set(gca,'fontweight','bold','fontsize',9);
    yticks(1.5:2:9.5);
    xticks(2:3:8);
    yticklabels({''});
    if st==2

        title('v. AC-veg FC_{sed} shrub','fontweight','bold','fontsize',9);
    else
        title('u. AC-veg FC_{sed} grass','fontweight','bold','fontsize',9);end
    xlabel('Soil Moisture (%)');
    xticklabels({'3.8','10.5','21.1'});
    plot([0.4 9.6],[2.5 2.5],'k-'); hold on
    plot([0.4 9.6],[4.5 4.5],'k-'); hold on
    plot([0.4 9.6],[6.5 6.5],'k-'); hold on
    plot([0.4 9.6],[8.5 8.5],'k-'); hold on

    plot([3.5 3.5],[0.5 10.5],'k-'); hold on
    plot([6.5 6.5],[0.5 10.5],'k-'); hold on

    plot([0.4 10.6],[1.5 1.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[3.5 3.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[5.5 5.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[7.5 7.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[9.5 9.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[1.5 2.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[3.5 4.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[5.5 6.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[7.5 8.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[9.5 10.5],'k--','linewidth',0.1); hold on

    ylim([0.5 10.5])
    xlim([0.5 9.5])

    c=colorbar;
    c.Orientation = 'Horizontal';
    c.Position = [0.54 0.06 0.19 0.024];
    clim([-0.4 0.4]);
    c.Ticks =-0.4:0.2:0.4;c.TickLabels ={'-0.4','-0.2','0','0.2','>=0.4'};
    view(2);
    c.Label.String = 'AC-vegetation';
    c.FontSize= 9;


    subaxis(1,8,st+6,'ML',0.05,'MR',0.01,'MT',0.56,'MB',0.14,'sh',0.01,'sv',0.0);
    h=  imagesc(squeeze(AC_micro(:,:,st)));hold on

    set(h, 'AlphaData', 1-isnan(squeeze(AC_micro(:,:,st))))
    daspect([1,1,1]);
    clim([-0.8 0.4]);
    set(gca,'fontweight','bold','fontsize',9);
    yticks(1.5:2:9.5);
    xticks(2:3:8);
    yticklabels({''});
    if st==2
        title('x. AC-topo FC_{sed} shrub','fontweight','bold','fontsize',9);
    else
        title('w. AC-topo FC_{sed} grass','fontweight','bold','fontsize',9);end
    xlabel('Soil Moisture (%)');
    xticklabels({'3.8','10.5','21.1'});
    plot([0.4 9.6],[2.5 2.5],'k-'); hold on
    plot([0.4 9.6],[4.5 4.5],'k-'); hold on
    plot([0.4 9.6],[6.5 6.5],'k-'); hold on
    plot([0.4 9.6],[8.5 8.5],'k-'); hold on

    plot([3.5 3.5],[0.5 10.5],'k-'); hold on
    plot([6.5 6.5],[0.5 10.5],'k-'); hold on

    plot([0.4 10.6],[1.5 1.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[3.5 3.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[5.5 5.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[7.5 7.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[9.5 9.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[1.5 2.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[3.5 4.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[5.5 6.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[7.5 8.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[9.5 10.5],'k--','linewidth',0.1); hold on

    ylim([0.5 10.5])
    xlim([0.5 9.5])

    c=colorbar;
    c.Orientation = 'Horizontal';
    c.Position = [0.783 0.06 0.19 0.024];
    clim([-0.8 0.4]);
    c.Ticks =[-0.8 -0.4 0 0.4];
     c.TickLabels ={'-0.8','-0.4','0','>=0.4'};
    view(2);
    c.Label.String = 'AC-microtopography';
    c.FontSize= 9;
end















%%

for st = 1:2
    subaxis(1,8,st,'ML',0.05,'MR',0.01,'MT',0.56,'MB',0.14,'sh',0.01,'sv',0.0);
    imagesc(squeeze(CD(:,:,st)));hold on
    daspect([1,1,1]);
    clim([0 1]);
    set(gca,'fontweight','bold','fontsize',9);
    yticks(1.5:2:9.5);
    xticks(2:3:8);
    if st==2
        yticklabels({''});
        title('15 x CD FC_{sed} shrub','fontweight','bold','fontsize',9);
    else
        yticklabels({'45','24','15','10','5'});
        ylabel('Rainfall (mm)')
        title('15 x CD FC_{sed} grass','fontweight','bold','fontsize',9);end
    xlabel('Soil Moisture (%)');
    xticklabels({'3.8','10.5','21.1'});
    plot([0.4 9.6],[2.5 2.5],'k-'); hold on
    plot([0.4 9.6],[4.5 4.5],'k-'); hold on
    plot([0.4 9.6],[6.5 6.5],'k-'); hold on
    plot([0.4 9.6],[8.5 8.5],'k-'); hold on

    plot([3.5 3.5],[0.5 10.5],'k-'); hold on
    plot([6.5 6.5],[0.5 10.5],'k-'); hold on

    plot([0.4 10.6],[1.5 1.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[3.5 3.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[5.5 5.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[7.5 7.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[9.5 9.5],'k--','linewidth',0.1); hold on


    plot([1.5 1.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[1.5 2.5],'k--','linewidth',0.1); hold on


    plot([1.5 1.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[3.5 4.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[5.5 6.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[7.5 8.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[9.5 10.5],'k--','linewidth',0.1); hold on

    ylim([0.5 10.5])
    xlim([0.5 9.5])

    c=colorbar;
    c.Orientation = 'Horizontal';
    c.Position = [0.07 0.06 0.19 0.024];
    clim([0 1]);
    c.Ticks =0:0.2:1;
    view(2);
    c.Label.String = 'Centralisation Degree (CD)';
    c.FontSize= 9;


    subaxis(1,8,st+2,'ML',0.05,'MR',0.01,'MT',0.56,'MB',0.14,'sh',0.01,'sv',0.0);
    imagesc(squeeze(GE(:,:,st)));hold on
    daspect([1,1,1]);
    clim([0 1.32*10^-5]);
    set(gca,'fontweight','bold','fontsize',9);
    yticks(1.5:2:9.5);
    xticks(2:3:8);
    yticklabels({''});
    if st==2

        title('3 x GE FC_{sed}-shrub','fontweight','bold','fontsize',9);
    else
        title('3 x GE FC_{sed} grass','fontweight','bold','fontsize',9);end
    xlabel('Soil Moisture (%)');
    xticklabels({'3.8','10.5','21.1'});
    plot([0.4 9.6],[2.5 2.5],'k-'); hold on
    plot([0.4 9.6],[4.5 4.5],'k-'); hold on
    plot([0.4 9.6],[6.5 6.5],'k-'); hold on
    plot([0.4 9.6],[8.5 8.5],'k-'); hold on

    plot([3.5 3.5],[0.5 10.5],'k-'); hold on
    plot([6.5 6.5],[0.5 10.5],'k-'); hold on

    plot([0.4 10.6],[1.5 1.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[3.5 3.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[5.5 5.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[7.5 7.5],'k--','linewidth',0.1); hold on
    plot([0.4 10.6],[9.5 9.5],'k--','linewidth',0.1); hold on


    plot([1.5 1.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[1.5 2.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[1.5 2.5],'k--','linewidth',0.1); hold on


    plot([1.5 1.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[3.5 4.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[3.5 4.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[5.5 6.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[5.5 6.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[7.5 8.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[7.5 8.5],'k--','linewidth',0.1); hold on

    plot([1.5 1.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([2.5 2.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([4.5 4.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([5.5 5.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([7.5 7.5],[9.5 10.5],'k--','linewidth',0.1); hold on
    plot([8.5 8.5],[9.5 10.5],'k--','linewidth',0.1); hold on

    ylim([0.5 10.5])
    xlim([0.5 9.5])

    c=colorbar;
    c.Orientation = 'Horizontal';
    c.Position = [0.302 0.06 0.19 0.024];
    clim([0 1.32*10^-5]);
    c.Ticks =0:0.33*10^-5 :1.32*10^-5;
    view(2);
    c.Label.String = 'Global Efficiency (GE)';
    c.FontSize= 9;
end
















%%
clf;
for st=1:2
    G= SC_network{1,st};

    subaxis(1,2,st,'ML',0.033,'MR',0.62,'MT',0.0,'MB',0.025,'sh',0.0,'sv',0.00);
    p=plot(G,'layout','force3');

    p.XData=G.Nodes.Xdata;
    p.YData=G.Nodes.Ydata;

    view(2)
    daspect([1,1,0.001]);
    box off
    axis off
    axis tight
    a=flip(pink(200));

    colormap(a(20:200,:));

    % p.NodeColor='k';
    EdgeC(1:1200)=0;
    A=G.Edges.EndNodes;
    EdgeC(A(:,1))=G.Edges.Weight;
    p.NodeCData = [1-EdgeC'];
    % p.MarkerSize=2*[1-EdgeC']+1;
    p.MarkerSize=3;
    p

    c = colorbar;
    if st==2
        c.Visible='off';end
    c.Orientation = 'Horizontal';
    c.Position = [0.061 0.07 0.28 0.024];
    caxis([0 1])
    c.Ticks = [0:0.25:1];
    c.TickLabels=[{'0','15','30','45','\geq 60'}];

    view(2);
    c.Label.String = 'Vegetation Cover (%)';



    p.LineWidth=0.5;
    p.ArrowSize=5;
    view(2);


    set(gca,'fontweight','bold','fontsize',12);
    set(gca, 'YDir', 'reverse');
end


txt = ['(a1) SC grassland'];
dim = [0.07,0.94,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

txt = ['(a2) SC shrubland'];
dim = [0.245,0.94,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

txt = ['(c1) grassland'];
dim = [0.41,0.61,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

txt = ['(c2) shrubland'];
dim = [0.506,0.61,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

txt = ['(c3) grassland'];
dim = [0.612,0.61,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

txt = ['(c4) shrubland'];
dim = [0.708,0.61,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

txt = ['(c5) grassland'];
dim = [0.8,0.61,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

txt = ['(c6) shrubland'];
dim = [0.896,0.61,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')




% txt = ['(c). Global network charactertics for SC network'];
% dim = [0.475,0.71,0.05,0.04];
% annotation('textbox',dim,'String',txt,'FontSize',12,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')


txt = ['upslope'];
dim = [0.012,0.895,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',11,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

txt = ['downslope'];
dim = [0.0,0.08,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',11,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')




for st=1:2
    G= SC_network{1,st};

    a1= subaxis(1,6,st,'ML',0.4,'MR',0.01,'MT',0.34,'MB',0.057,'sh',0.0,'sv',0.00);
    p=plot(G,'layout','force3');

    p.XData=G.Nodes.Xdata;
    p.YData=G.Nodes.Ydata;

    view(2)
    daspect([1,1,0.001]);
    box off
    axis off
    axis tight

    Pathways(1:1200,1:1200)=0;


    for m=1:1200
        a=nearest(G,m,1200);
        Pathways(m,a)=1;end

    incoming_pathways=sum(Pathways);
    outgoinging_pathways=sum(Pathways');

    LOCPP(st,:)=incoming_pathways;


    stats(1,st)=max(incoming_pathways);
    stats(2,st)=min(incoming_pathways);
    stats(3,st)=mean(incoming_pathways);
    stats(4,st)=std(incoming_pathways);
    stats(5,st)=sum(incoming_pathways>=41);
    stats(6,st)=sum(incoming_pathways<=0);



    p.MarkerSize=5;
    p.Marker='s';
    p.NodeCData=incoming_pathways;



    c = colorbar;
    c.Orientation = 'Horizontal';
    c.Position = [0.415 0.07 0.17 0.024];
    caxis([0 75])
    c.Ticks = [0:15:75];
    if st==2
        c.Visible='off';end


    view(2);
    c.Label.String = 'Length of Connected Pathways';

    set(gca,'fontweight','bold','fontsize',12);
    set(gca, 'YDir', 'reverse');
end



for st=1:2
    G= SC_network{1,st};

    a1= subaxis(1,6,st+2,'ML',0.4,'MR',0.01,'MT',0.34,'MB',0.057,'sh',0.0,'sv',0.00);
    p=plot(G,'layout','force3');

    p.XData=G.Nodes.Xdata;
    p.YData=G.Nodes.Ydata;

    view(2)
    daspect([1,1,0.001]);
    box off
    axis off
    axis tight

    betweenness=centrality(G,'betweenness');

    stats(1,st)=max(betweenness);
    stats(2,st)=min(betweenness);
    stats(3,st)=mean(betweenness);
    stats(4,st)=std(betweenness);
    stats(5,st)=sum(betweenness>=112);
    stats(6,st)=sum(betweenness<=0);



    BCP(st,:)=squeeze(betweenness);
    p.MarkerSize=5;
    p.Marker='s';
    p.NodeCData=betweenness;



    c = colorbar;
    c.Orientation = 'Horizontal';
    c.Position = [0.612 0.07 0.17 0.024];
    caxis([0 500])
    c.Ticks = [0:100:500];
    if st==2
        c.Visible='off';end


    view(2);
    c.Label.String = 'Betweenness Centrality';

    view(2);

    set(gca,'fontweight','bold','fontsize',12);
    set(gca, 'YDir', 'reverse');
end




for st=1:2
    G= SC_network{1,st};

    a1= subaxis(1,6,st+4,'ML',0.4,'MR',0.01,'MT',0.34,'MB',0.057,'sh',0.0,'sv',0.00);
    p=plot(G,'layout','force3');

    p.XData=G.Nodes.Xdata;
    p.YData=G.Nodes.Ydata;

    view(2)
    daspect([1,1,0.001]);
    box off
    axis off
    axis tight

    Globalefficiency=mean(centrality(G,'outcloseness')+centrality(G,'incloseness'));
    for m=1:1200
        H=rmnode(G,m);
        nodeefficiency(m)=mean(centrality(H,'outcloseness')+centrality(H,'incloseness'));
    end
    nodeefficiency=(Globalefficiency-nodeefficiency)*100/Globalefficiency;

    nodeefficiencyf(st,:)=nodeefficiency;

    stats(1,st)=max(nodeefficiency);
    stats(2,st)=min(nodeefficiency);
    stats(3,st)=mean(nodeefficiency);
    stats(4,st)=std(nodeefficiency);
    stats(5,st)=sum(nodeefficiency>=1.155);
    stats(6,st)=sum(nodeefficiency<=-0.2506);


    p.MarkerSize=5;
    p.Marker='s';
    p.NodeCData=nodeefficiency;



    c = colorbar;
    c.Orientation = 'Horizontal';
    c.Position = [0.81 0.07 0.17 0.024];
    caxis([-0.25 1])
    c.Ticks = [-0.25:0.25:1];
    if st==2
        c.Visible='off';end


    view(2);
    c.Label.String = 'Relative Node Efficiency';

    view(2);

    set(gca,'fontweight','bold','fontsize',12);
    set(gca, 'YDir', 'reverse');
end


%LOCP
[H_LOCP,P_LOCP,CI_LOCP,STATS_LOCP] = ttest2(LOCPP(1,:), LOCPP(2,:));

%BCP

[H_BCP,P_BCP,CI_BCP,STATS_BCP] = ttest2(BCP(1,:), BCP(2,:));

%BCP

[H_NEP,P_NEP,CI_NEP,STATS_NEP] = ttest2(nodeefficiencyf(1,:), nodeefficiencyf(2,:));



ax= subaxis(1,3,1,'ML',0.415,'MR',0.01,'MT',0.08,'MB',0.8,'sh',0.05,'sv',0.00);

p1=scatter([0.60],[0],85,'or','filled'); hold on
p2=scatter([0.80],[0],85,'sb','filled'); hold on
box off
set(gca,'fontweight','bold','fontsize',11);
xlim([0 1])
ylim([0 eps]);
ax.YColor='none';
xlabel('Centralisation Degree');
legend('grassland','shrubland','Orientation','Horizontal');


p1.DataTipTemplate.DataTipRows(1) = dataTipTextRow('',0.60,'%4.3g');
p1.DataTipTemplate.DataTipRows(2) = '';
dt = datatip(p1,0.60,0);



p2.DataTipTemplate.DataTipRows(1) = dataTipTextRow('',0.80,'%4.3g');
p2.DataTipTemplate.DataTipRows(2) = '';
dt = datatip(p2,0.80,0);




ax= subaxis(1,3,2,'ML',0.415,'MR',0.01,'MT',0.08,'MB',0.8,'sh',0.05,'sv',0.00);

p1=scatter([0.27],[0],85,'or','filled'); hold on
p2=scatter([0.19],[0],85,'sb','filled'); hold on
box off
set(gca,'fontweight','bold','fontsize',11);
xlim([-1 1])
ylim([0 eps]);
ax.YColor='none';
xlabel('Assortativity Coefficient_{vegetation}');
legend('grassland','shrubland','Orientation','Horizontal');

p1.DataTipTemplate.DataTipRows(1) = dataTipTextRow('',0.27,'%4.3g');
p1.DataTipTemplate.DataTipRows(2) = '';
dt = datatip(p1,0.27,0);

p2.DataTipTemplate.DataTipRows(1) = dataTipTextRow('',0.19,'%4.3g');
p2.DataTipTemplate.DataTipRows(2) = '';
dt = datatip(p2,0.19,0);


ax= subaxis(1,3,3,'ML',0.415,'MR',0.01,'MT',0.08,'MB',0.8,'sh',0.05,'sv',0.00);

p1=scatter([1.10*10^-6],[0],85,'or','filled'); hold on
p2=scatter([2.88*10^-6],[0],85,'sb','filled'); hold on
box off
set(gca,'fontweight','bold','fontsize',11);
xlim([0 3*10^-6])
ylim([0 eps]);
ax.YColor='none';
xlabel('Global Efficiency');
legend('grassland','shrubland','Orientation','Horizontal');

p1.DataTipTemplate.DataTipRows(1) = dataTipTextRow('',1.10*10^-6,'%4.3g');
p1.DataTipTemplate.DataTipRows(2) ='';
dt = datatip(p1,1.10*10^-6,0);

p2.DataTipTemplate.DataTipRows(1) = dataTipTextRow('',2.88*10^-6,'%4.3g');
p2.DataTipTemplate.DataTipRows(2) ='';
dt = datatip(p2,2.88*10^-6,0);

txt = ['(b1)'];
dim = [0.393,0.9,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',10,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

txt = ['(b2)'];
dim = [0.6,0.9,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',10,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

txt = ['(b3)'];
dim = [0.81,0.9,0.05,0.04];
annotation('textbox',dim,'String',txt,'FontSize',10,'FontWeight','Bold','FitBoxToText','on','Color','k','EdgeColor','none')

