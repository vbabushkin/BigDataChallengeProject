%read the data
fid=fopen('CiTcUcSm1.txt');
M = textscan(fid,'%f %f %f %f','delimiter',',');
fclose(fid);
data=[M{1},M{2},M{3},M{4}];
%milano Grid Matrix
matr=zeros(100,100);
[x,y]=find(matr==0);
matr(x,y) = NaN;
%populate matrix
    
%match the data with grid to visualize average happiness
for i=1:size(data,1)
    index=data(i,1);
    [ rInd,cInd ] = rowNum2Index( index );
    matr(rInd,cInd)=(data(i,4));
    %matr(rInd,cInd)=(data(i,3)*0.095+5.65);
end
cLow=min(data(:,4));
cHigh=max(data(:,4));
%imagesc(matr);
imagesc2(matr);
axis on
%set(b,'AlphaData',~isnan(b))
%imagesc2(log(matr));
colorbar;
set(gca, 'CLim', [cLow, cHigh]);
ylabel('Latitude')
xlabel('Longitude')
set(gca,'YTick',[5:110/11.8:110])
set(gca,'XTick',[0:110/7:100])
set(gca,'YTickLabel',{'45.56','45.54','45.52','45.5','45.48', '45.46','45.44','45.42','45.4', '45.38','45.36'})
set(gca,'XTickLabel',{'9.3','9.05', '9.1', '9.15', '9.2', '9.25'})

% minLon=9.011490619692509
% maxLon=9.312688264185276
% minLat=45.356685994655464
% maxLat=45.56778671132765
%  
% 
% 
% 
% axis([minLon maxLon  minLat maxLat]);
% 
% plot_google_map('maptype','roadmap','AutoAxis',1)%'hybrid')
% ylabel('Latitude')
% xlabel('Longitude')
 
