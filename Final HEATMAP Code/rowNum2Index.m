function [ rInd,cInd ] = rowNum2Index( index )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if(mod(index,100)==0)
    cInd=100;
    rInd=101-index/100;
else
    cInd=mod(index,100);
    rInd=100-floor(index/100);
end




end

