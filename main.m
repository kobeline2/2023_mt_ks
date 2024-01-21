% main.m - main code of the project
clear; clc;
run('parameters.m');
Data = load(Param.dataPath);
Data = preprocessData(Data, Param);
Data = makeTrainTestData(Data, Param);
[Data, ParamNorm] = normalizeData(Data, Param);
if ~Param.isprediction
    h  = feval(Param.modelval, Data, Param);
    ypred = feval(Param.modelfit, Data, Param, h, Data.Xtest);
else
    DataPred = load(Param.predictData);
    DataPred.X = DataPred.C{:, Param.Xindex};
    DataPred = rmfield(DataPred, "C");
    load(Param.hyp);
    load(Param.ParamNorm);
    [DataPred, ParamNorm] = normalizeData(DataPred, Param, ParamNorm);
    ypred = feval(Param.modelfit, Data, Param, h, DataPred.X);
end
evaluateModel(ypred(:, 1), Data.ytest);
postprocessResults(Data, ypred, ParamNorm, Param)
