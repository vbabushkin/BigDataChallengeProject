%read the data
fid=fopen('geo_avg_happy_all.txt');
M = textscan(fid,'%f %f %f %f','delimiter',',');
fclose(fid);
data=[M{1},M{2},M{3}];
data=sortrows(data,1);
fid=fopen('id-and-their-coordinates.txt');
M = textscan(fid,'%f %f %f %f %f %f %f %f %f %f %f ','delimiter',',');
fclose(fid);
coords=[M{1},M{2},M{3}];

newData=[coords(data(:,1),2:end) data(:,2)];

output=[]

for row=1:size(newData,1)
    for n=1:newData(row,3)
        output=[output; newData(row,1); newData(row,2)];
    end
end
output=[9.312688;45.567787;9.011491;45.356686 ; output];
 
fileID = fopen('num.txt','w');
fprintf(fileID,'%f %f \r\n',output);
fclose(fileID);