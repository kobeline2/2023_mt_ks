% 01:Qs
% 02:QsperM
% 03:mm
% 04:depth
% 05:vw
% 06:qs
% 07:ips10,08:ips9, 09:ips8, 10:ips7, 11:ips6,
% 12:ips5, 13:ips4, 14:ips3, 15:ips2, 16:ips1

Param = struct();
Param.isprediction = false;
Param.dataPath = 'data/processed/C.mat';
Param.yindex = 1; % 1:Qs, 3:Ds
Param.Xindex = [7:16];

Param.D = length(Param.Xindex);

% preprocessing
Param.logy = false;
Param.normMethod = "scale";
Param.seedPartition = 'r';
Param.pPartition = 0.7; % train data rate

% % モデルのタイプ
Param.modelval = 'gpval';
Param.modelfit = 'gpfit';

% GP
Param.maxIters   = 1000;
Param.seedGP = 'r';
