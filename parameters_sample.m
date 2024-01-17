% 01:date
% 02:Qs m^2/s
% 03:Ds mm
% 04:ips10,05:ips9, 06:ips8, 07:ips7, 08:ips6,
% 09:ips5, 10:ips4, 11:ips3, 12:ips2, 13:ips1

Param = struct();
Param.isprediction = false;
Param.dataPath = 'data/processed/hodakaExpSiteConcatLog.mat';
Param.isused = [1:2040, 2101:2150];
Param.yindex = 2; % 2:Qs, 3:Ds
Param.Xindex = [4:13];



Param.D = length(Param.Xindex);

% preprocessing
Param.logy = false;
Param.coefLog = 5.0505e-06; % value to convert the minumum data 1
Param.normMethod = "scale";
Param.seedPartition = 'r';
Param.pPartition = 0.7; % train data rate

% % モデルのタイプ
Param.modelval = 'gpval';
Param.modelfit = 'gpfit';

% GP
Param.maxIters   = 3000;
Param.seedGP = 'r';
