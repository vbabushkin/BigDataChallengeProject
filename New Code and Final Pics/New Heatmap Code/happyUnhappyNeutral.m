threshold=0.15; %threshold % top happy and top unhappy

%read the data
fid=fopen('geo_avg_happy_all.txt');
M = textscan(fid,'%f %f %f %f','delimiter',',');
fclose(fid);
data=[M{1},M{2},M{3}];

data=sortrows(data,3);
unhappyIndex=round(size(data,1)*threshold);
happyIndex=round(size(data,1)*(1-threshold));
classLabel=zeros(size(data,1),1);
classLabel(1:unhappyIndex,:)=-1;
classLabel(happyIndex:end,:)=1;
data=[data,classLabel];
%milano Grid Matrix
matr=zeros(100,100);
[x,y]=find(matr==0);
matr(x,y) = NaN;
% for i=1:size(matr,1)
%    for j=1:size(matr,2)
%        matr(i,j)=-2;
%    end
% end
%populate matrix
%match the data with grid to visualize average happiness
for i=1:size(data,1)
    index=data(i,1);
    [ rInd,cInd ] = rowNum2Index( index );
    matr(rInd,cInd)=data(i,4);
end


N=4;                                                    %  # of data types, hence legend entries                                % generate fake data
imagesc2(matr);
axis on                                         % image it
cmap = jet(N);                                          % assigen colormap
colormap(cmap)
hold on
L = line(ones(N),ones(N), 'LineWidth',2);               % generate line 
set(L,{'color'},mat2cell(cmap,ones(1,N),3));            % set the colors according to cmap
legend('Unhappy','','Neutral','Happy') % add as many legend entries as 
 
str=['Threshold ',num2str(threshold*100),'%'];
title(str)
ylabel('Latitude')
xlabel('Longitude')
set(gca,'YTick',[5:110/11.8:110])
set(gca,'XTick',[0:110/7:100])
set(gca,'YTickLabel',{'45.56','45.54','45.52','45.5','45.48', '45.46','45.44','45.42','45.4', '45.38','45.36'})
set(gca,'XTickLabel',{'9.3','9.05', '9.1', '9.15', '9.2', '9.25'})
 