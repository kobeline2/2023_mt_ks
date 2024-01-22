% main.m - main code of the project
clear; clc;
run('parameters.m');
load(Param.Data);
if Param.isprediction % prediction
    DataPred = load(Param.predictData);
    load(Param.hyp);
    load(Param.ParamNorm);
    DataPred.X = DataPred.C{:, Param.Xindex};
    [DataPred, ParamNorm] = normalizeData(DataPred, Param, ParamNorm);
    ypred = feval(Param.modelfit, Data, Param, h, DataPred.X);
else % Learning
    Data = preprocessData(Data, Param);
    Data = makeTrainTestData(Data, Param);
    [Data, ParamNorm] = normalizeData(Data, Param); 
    h  = feval(Param.modelval, Data, Param);
    ypred = feval(Param.modelfit, Data, Param, h, Data.Xtest);
    evaluateModel(ypred(:, 1), Data.ytest);
end
Res = postprocessResults(Data, ypred, ParamNorm, Param);
if Param.outputExcel
    outputPredictionExcel(Res, Param);
end