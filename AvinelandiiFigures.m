%iDT1278
%1) Carbon and nitrogen growth analysis
%2) Carbon and nitrogen flux distribution analysis
%%

%1) Carbon and nitrogen growth analysi
load('ModelbenchmarkingdataCarbon.mat')
%Carbon and nitrogen benchmarking using BIOLOG plates data (PM1 and PM2 for carbon sources and PM3 for nitrogen sources)
%lets filter the data, removing true negatives from the displayed figure
%CARBON SOURCES (PM1 and PM2)
x=1:length(DatosC);
baseLine = 0;
index=1:length(DatosC);
y1=Simulations(:,1)';
y2=Simulations(:,2)';
y3=Simulations(:,3)';
j1=figure(1);
 subplot(1,2,1)
H=errorbarxy(DatosC(:,1),1:length(DatosC),DatosC(:,2),'',{'ks', 'k', 'k'}); 
hold on
errorbarxy(DatosC(:,5),1:length(DatosC),DatosC(:,6),'',{'ko', 'k', 'k'});
errorbarxy(DatosC(:,3),1:length(DatosC),DatosC(:,4),'',{'k.', 'k', 'k'});
axis([-0.00052 0.025 0 length(DatosC)+1])
plot(Simulations(:,2),1:length(DatosC),'MarkerEdgeColor','w')
c=[0.6,0.8,1.0];
d=[0.7,0.9,1.0];
h2 = fill([baseLine y2(index) baseLine],...        %# Plot the second filled polygon
          x(index([1 1:end end])),...
          c,'EdgeColor',d, 'FaceAlpha', 0.2);
plot(Simulations(:,1),1:length(DatosC),'MarkerEdgeColor','w')
c=[0,0.5,0.0];
h1 = fill([baseLine y1(index) baseLine],...        %# Plot the first filled polygon
          x(index([1 1:end end])),...
          c,'EdgeColor','w', 'FaceAlpha', 0.2);
plot(Simulations(:,3),1:length(DatosC),'MarkerEdgeColor','w')
c = [1 0.8 0.25];
d=[0.7,0.9,1.0];
h2 = fill([baseLine y3(index) baseLine],...        %# Plot the second filled polygon
          x(index([1 1:end end])),...
          c,'EdgeColor','w', 'FaceAlpha', 0.2);   
      
hold off
set(gca, 'YTick', 1:length(DatosC), 'YTickLabel', DataPM2(1:length(DataPM2),1:1));
xlabel('Growth rate (h^-^1)');
axis([0 0.013 0 71])

clear 

%NITROGEN SOURCES (PM3)
load('ModelbenchmarkingdataNitrogen.mat')
x=1:length(DatosC);
baseLine = 0;
index=1:length(DatosC);
y1=Simulations(:,1)';
y2=Simulations(:,2)';
y3=Simulations(:,3)';
j1=figure(1);
 subplot(1,2,1)
H=errorbarxy(DatosC(:,1),1:length(DatosC),DatosC(:,2),'',{'ks', 'k', 'k'}); 
hold on
errorbarxy(DatosC(:,5),1:length(DatosC),DatosC(:,6),'',{'ko', 'k', 'k'});
errorbarxy(DatosC(:,3),1:length(DatosC),DatosC(:,4),'',{'k.', 'k', 'k'});
axis([-0.00052 0.025 0 length(DatosC)+1])
plot(Simulations(:,2),1:length(DatosC),'MarkerEdgeColor','w')
c=[0.6,0.8,1.0];
d=[0.7,0.9,1.0];
h2 = fill([baseLine y2(index) baseLine],...        %# Plot the second filled polygon
          x(index([1 1:end end])),...
          c,'EdgeColor',d, 'FaceAlpha', 0.2);
plot(Simulations(:,1),1:length(DatosC),'MarkerEdgeColor','w')
c=[0,0.5,0.0];
h1 = fill([baseLine y1(index) baseLine],...        %# Plot the first filled polygon
          x(index([1 1:end end])),...
          c,'EdgeColor','w', 'FaceAlpha', 0.2);
plot(Simulations(:,3),1:length(DatosC),'MarkerEdgeColor','w')
c = [1 0.8 0.25];
d=[0.7,0.9,1.0];
h2 = fill([baseLine y3(index) baseLine],...        %# Plot the second filled polygon
          x(index([1 1:end end])),...
          c,'EdgeColor','w', 'FaceAlpha', 0.2);   
      
hold off
set(gca, 'YTick', 1:length(DatosC), 'YTickLabel', DataPM2(1:length(DataPM2),1:1));
xlabel('Growth rate (h^-^1)');
axis([0 0.01 0 13])

clear

%%
%Carbon and nitrogen flux distribution analysis
load('ClustergramData.mat')

%Carbon fluxes
gc17=clustergram(cumr2Sub,'RowLabels',adjustedNames','ColumnLabels',adjustedNames,'Symmetric','false','Colormap',redbluecmap,'Cluster',3,'ColumnLabelsRotate',35)
title12 = addTitle(gc17,'Correlation of carbon fluxes during diazotroph and non-diazotroph conditions per subsystem');

%Nitrogen fluxes
gc120=clustergram(cumr2Sub2,'RowLabels',NamesNitrogen','ColumnLabels',NamesNitrogen,'Symmetric','false','Colormap',redbluecmap,'Cluster',3,'ColumnLabelsRotate',35)
title120 = addTitle(gc120,'Correlation of nitrogen fluxes during diazotroph and non-diazotroph conditions per subsystem');
