clear all; clc;clf;

cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Network2');
load('SC_network.mat');
load('FC_network_sedtr');
FC_network_sedtr=FC_network;
load('FC_network_dschg');

cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Data');

for rain=1:5
    rain
    for st=1:2

        G1= SC_network{1,st};
        G2= FC_network{rain,3,st};
        G3= FC_network_sedtr{rain,3,st};



            A=G1.Edges.EndNodes;
            B=G2.Edges.EndNodes;
            C=G3.Edges.EndNodes;


            Pathways(1:1200,1:1200)=0;
            b=[G1.Edges.EndNodes G1.Edges.Weight];

            for m=1:1200
                a=nearest(G1,m,1200);
                c=ismember(b(:,1),[m;a(1:end-1)]);
                Pathways(m,a)=b(c,3);end

            SCpathways=sum(Pathways);


            Pathways(1:1200,1:1200)=0;
            b=[G2.Edges.EndNodes G2.Edges.Weight];

            for m=1:1200
                a=nearest(G2,m,1200);
                c=ismember(b(:,1),[m;a(1:end-1)]);
                Pathways(m,a)=b(c,3);end

            FCwaterpathways=sum(Pathways);


            Pathways(1:1200,1:1200)=0;
            b=[G3.Edges.EndNodes G3.Edges.Weight];

            for m=1:1200
                a=nearest(G3,m,1200);
                c=ismember(b(:,1),[m;a(1:end-1)]);
                Pathways(m,a)=b(c,3);end

            FCsedimentpathways=sum(Pathways);


            SCbetweenness=centrality(G1,'betweenness','cost',1./G1.Edges.Weight);
            FCwaterbetweenness=centrality(G2,'betweenness','cost',1./G2.Edges.Weight);
            FCsedimentbetweenness=centrality(G3,'betweenness','cost',1./G3.Edges.Weight);

            GE=mean(centrality(G1,'outcloseness','Cost',1./G1.Edges.Weight)+centrality(G1,'incloseness','Cost',1./G1.Edges.Weight));
            for m=1:1200
                H=rmnode(G1,m);
                hweight=H.Edges.Weight;
                nodeefficiency(m)=mean(centrality(H,'outcloseness','Cost',1./hweight)+centrality(H,'incloseness','Cost',1./hweight));
            end
            SCnodeeff=(GE-nodeefficiency)*100/GE;


            GE=mean(centrality(G2,'outcloseness','Cost',1./G2.Edges.Weight)+centrality(G2,'incloseness','Cost',1./G2.Edges.Weight));
            for m=1:1200
                H=rmnode(G2,m);
                hweight=H.Edges.Weight;
                nodeefficiency(m)=mean(centrality(H,'outcloseness','Cost',1./hweight)+centrality(H,'incloseness','Cost',1./hweight));
            end
            FCwaternodeeff=(GE-nodeefficiency)*100/GE;


            GE=mean(centrality(G3,'outcloseness','Cost',1./G3.Edges.Weight)+centrality(G3,'incloseness','Cost',1./G3.Edges.Weight));
            for m=1:1200
                H=rmnode(G3,m);
                hweight=H.Edges.Weight;
                nodeefficiency(m)=mean(centrality(H,'outcloseness','Cost',1./hweight)+centrality(H,'incloseness','Cost',1./hweight));
            end
            FCsedimentnodeeff=(GE-nodeefficiency)*100/GE;



            nodemeasures(st,1,:)= SCpathways;
            nodemeasures(st,2,:)= SCbetweenness;
            nodemeasures(st,3,:)= SCnodeeff;
            nodemeasures(st,rain*6-2,:)= FCwaterpathways;
            nodemeasures(st,rain*6-1,:)= FCwaterbetweenness;
            nodemeasures(st,rain*6,:)= FCwaternodeeff;
            nodemeasures(st,rain*6+1,:)= FCsedimentpathways;
            nodemeasures(st,rain*6+2,:)= FCsedimentbetweenness;
            nodemeasures(st,rain*6+3,:)= FCsedimentnodeeff;

       if isempty(G2.Edges)
            nodemeasures(st,rain*6-2,:)= NaN;
            nodemeasures(st,rain*6-1,:)= NaN;
            nodemeasures(st,rain*6,:)= NaN;end


        if isempty(G3.Edges)
                        nodemeasures(st,rain*6+1,:)= NaN;
                        nodemeasures(st,rain*6+2,:)= NaN;
                        nodemeasures(st,rain*6+3,:)= NaN;end

        end
    end


for st=1:2
for i=1:33
    for j=1:33
        CC=corrcoef(squeeze(nodemeasures(st,i,:))',squeeze(nodemeasures(st,j,:))');
        connrelationship(st,i,j)=CC(1,2);
    end
end
end

%%

% matrix1 = squeeze(connrelationship(1,:,:));
% matrix1(tril(true(size(matrix1)))) = 0;
% 
% matrix2 = squeeze(connrelationship(2,:,:));
% matrix2(triu(true(size(matrix2)))) = 0;
% 
% matrix=matrix1+matrix2;
% matrix(matrix==0)=NaN;


cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Data');


aa= connrelationship;
aa(isnan(aa))=0;
rainfall=[{'Rainfall = 45 mm','Rainfall = 24 mm','Rainfall = 15 mm','Rainfall = 10 mm','Rainfall = 5 mm'}];


clf

        for st=1:2
            for rain = 1:5

            subaxis(2,5,5*st-5+rain,'ML',0.1,'MR',0.024,'MT',0.03,'MB',0.26,'sh',0.01,'sv',0.01);
            matrix=squeeze(connrelationship(st,[1:3 rain*6-2:rain*6+3],[1:3 rain*6-2:rain*6+3]));
            
            matrix_new(9*rain-9+1:9*rain,9*st-9+1:9*st)=matrix;end
        end
            h=imagesc(squeeze(matrix)); hold on

            set(h, 'AlphaData', 1-isnan(matrix))
            clim([-0.2 1]);
            set(gca,'fontweight','bold','fontsize',10);
            daspect([1,1,1])
            yticks('')
            ytickangle(0);
            xtickangle(90);
            box on
            

            % if rain~=5
            %     xticks('');end
            % if st==1 && type==1
            %     yticks([1:3]);
            % ylabel(rainfall(rain));end
            % 
            % xticklabels({'LOCP','BC','RNE'})
            % yticklabels({'LOCP','BC','RNE'})
            % 
            % if rain==1
            %     title( append(number{type*2-2+st},relation{type},plot{st}),'fontweight','bold','fontsize',11);end
            % 
            % if rain==1&&type==1&&st==1
                colormap(parula(24));
                 c=colorbar;
c.Orientation='horizontal';


                c.Position = [0.275 0.067 0.5 0.035];
                c.Ticks = [-0.2:0.2:1];
                c.Label.String = 'Pearson Correlation Coefficient';
                c.FontSize=12;
                c.Visible='off';
            
            xticks([1:9]);
    yticks([1:9]);
xticklabels({''});
yticklabels({''});

                if st==2

xticklabels({'SC WLOCOP','SC BC','SC RNE','FC_{hyd} WLOCOP','FC_{hyd} BC','FC_{hyd} RNE','FC_{sed} WLOCOP','FC_{sed} BC','FC_{sed} RNE'});end

if st==1
    title(rainfall{1,rain},'fontsize',14);end


if rain==1

yticklabels({'SC WLOCOP','SC BC','SC RNE','FC_{hyd} WLOCOP','FC_{hyd} BC','FC_{hyd} RNE','FC_{sed} WLOCOP','FC_{sed} BC','FC_{sed} RNE'});

 if st==1
     ylabel('Grassland','fontsize',14);else
     c.Visible='on';
     ylabel('Shrubland','fontsize',14);end
            end

                hold on;
                box on
                % grid on
% for i = 1:33
%     for j = 1:33
% 
%         % Draw horizontal and vertical lines
%         line([j-0.5, j-0.5], [i-0.5, i+0.5], 'Color', 'k', 'LineWidth', 0.05);
%         line([j-0.5, j+0.5], [i-0.5, i-0.5], 'Color', 'k', 'LineWidth', 0.05);
%     end
% end

            end
        end









% 
% cd('C:\Users\shubh\OneDrive - Durham University\Desktop\PhD\Chapter1\Data');
% 
% plot=[{'grassland', 'shrubland'}];
% relation=[{'SFw ','SFs ','FwFs '}];
% number=[{'a. ','b. ','c. ','d. ','e. ','f. '}];
% rainfall=[{'rainfall = 45 mm','rainfall = 24 mm','rainfall = 15 mm','rainfall = 10 mm','rainfall = 5 mm'}];
% 
% 
% aa= connrelationship;
% aa(isnan(aa))=0;
% 
% clf
% 
%         for st=1:2
% 
%             subaxis(1,2,st,'ML',0.06,'MR',0.1,'MT',0.02,'MB',0.04,'sh',0.05,'sv',0.008);
%             h=imagesc(squeeze(connrelationship(st,:,:))); hold on
% 
%             set(h, 'AlphaData', 1-isnan(squeeze(connrelationship(st,:,:))))
%             clim([-0.2 1]);
%             set(gca,'fontweight','bold','fontsize',10);
%             daspect([1,1,1])
%             yticks('')
% 
%             % if rain~=5
%             %     xticks('');end
%             % if st==1 && type==1
%             %     yticks([1:3]);
%             % ylabel(rainfall(rain));end
%             % 
%             % xticklabels({'LOCP','BC','RNE'})
%             % yticklabels({'LOCP','BC','RNE'})
%             % 
%             % if rain==1
%             %     title( append(number{type*2-2+st},relation{type},plot{st}),'fontweight','bold','fontsize',11);end
%             % 
%             % if rain==1&&type==1&&st==1
%                 colormap(parula(20));
%                 % c=colorbar;
% 
% 
%                 % c.Position = [0.603 0.25 0.02 0.5];
%                 % c.Ticks = [0:0.18:0.90];
%                 % c.Label.String = 'Pearson Correlation Coefficient';
%                 % c.FontSize=11;end
% 
% xticks([1:33]);
% yticks([1:33]);
%                 hold on;
% for i = 1:33
%     for j = 1:33
% 
%         % Draw horizontal and vertical lines
%         line([j-0.5, j-0.5], [i-0.5, i+0.5], 'Color', 'k', 'LineWidth', 0.1);
%         line([j-0.5, j+0.5], [i-0.5, i-0.5], 'Color', 'k', 'LineWidth', 0.1);
%     end
% end
% 
%   end
% 
% 
