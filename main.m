% main.m - main code of the project
clear; clc;
run('parameters.m');
Data = load(Param.dataPath);
if ~Param.isprediction
    Data = preprocessData(Data, Param);
    Data = makeTrainTestData(Data, Param);
    [Data, ParamNorm] = normalizeData(Data, Param);
    h  = feval(Param.modelval, Data, Param);
end
ypred = feval(Param.modelfit, Data, Param, h, Data.Xtest);
evaluateModel(ypred(:, 1), Data.ytest);
postprocessResults(Data, ypred, ParamNorm, Param)

% % 結果の保存
% save('results/results.mat', 'results');
% % 後処理と結果の可視化
% postProcessedResults = postprocessResults(results);
% save('results/analysis/postProcessedResults.mat', 'postProcessedResults');
% 
% % グラフの生成と保存
% fig = createFigures(postProcessedResults);
% saveas(fig, 'results/figures/resultFigures.fig');
% 
% % 環境のクリーンアップ
% rmpath('src');
% rmpath('src/utils');