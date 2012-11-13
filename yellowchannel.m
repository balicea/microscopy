function [YM] = yellowchannel(t, 'import')
%%
% creates yellow channel (true positive green signal) for further analysis. t = threshold value % between -1 and 254. 'import' is a rasterized graphic file (e.g. .tif, .jpg).
%%
x = image('import')
%%
% import images as x-by-y-by-z matrices.
%%
r = x(:,:,1);
g = x(:,:,2);
b = x(:,:,3);
rn = r/(r+g+b);
gn = g/(r+g+b);
bn = b/(r+g+b);
%%
% extract and normalize color channels. red = 255,0,0; green = 0,255,0; blue = 0,0,255.
%%
r2 = rn > t;
g2 = gn > t;
b2 = bn > t;
%%
% further normalize all channels relative to nueric threshold.
%%
y1 = r2 - g2;
b3 = b2 * -1;
y2 = b3 + y1;
%%
% generates a yellow-only channel without noise (low-intensity overlap of red and green). 
%%
[YM] = image(y2)
%%
% generate a binary color map (YM = yellow map). This output can be used to calculate yellow channel statistics.
%%
