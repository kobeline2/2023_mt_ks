% main.m - main code of the project
clear; clc;
run('parameters.m');
Data = load(Param.Data);
Data = preprocessData(Data, Param);
Data = makeTrainTestData(Data, Param);
[Data, ParamNorm] = normalizeData(Data, Param);
if ~Param.isprediction
    h  = feval(Param.modelval, Data, Param);
    ypred = feval(Param.modelfit, Data, Param, h, Data.Xtest);
    evaluateModel(ypred(:, 1), Data.ytest);
else
    DataPred = load(Param.predictData);
    load(Param.hyp);
    load(Param.ParamNorm);
    DataPred.X = DataPred.C{:, Param.Xindex};
    [DataPred, ParamNorm] = normalizeData(DataPred, Param, ParamNorm);
    ypred = feval(Param.modelfit, Data, Param, h, DataPred.X);
end
Res = postprocessResults(Data, ypred, ParamNorm, Param);
if Param.outputExcel
    outputPredictionExcel(Res, Param);
end