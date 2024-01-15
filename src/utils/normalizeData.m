function [Data, ParamNorm] = normalizeData(Data, Param)
    
[Data.Xtrain, ParamNorm.cX, ParamNorm.sX] =...
    normalize(Data.Xtrain, Param.normMethod);
[Data.ytrain, ParamNorm.cy, ParamNorm.sy] =...
    normalize(Data.ytrain, Param.normMethod);

Data.Xtest = (Data.Xtest - ParamNorm.cX) ./ ParamNorm.sX;
Data.ytest = (Data.ytest - ParamNorm.cy) ./ ParamNorm.sy;


end