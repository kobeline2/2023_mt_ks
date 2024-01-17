function postprocessResults(Data, ymean, ParamNorm, Param)
figure;
if size(ymean, 2) == 2
    nsigma = 2;
    ystd  = sqrt(ymean(:, 2));
    ymean = ymean(:, 1);
    yupper  = (ymean + nsigma*ystd) * ParamNorm.sy + ParamNorm.cy;
    ylower  = (ymean - nsigma*ystd) * ParamNorm.sy + ParamNorm.cy;
    ymean   = ymean * ParamNorm.sy + ParamNorm.cy;
    yactual = Data.ytest * ParamNorm.sy + ParamNorm.cy;
    if Param.logy
        yupper  = exp(yupper)*Param.coefLog;
        ylower  = exp(ylower)*Param.coefLog;
        ymean   = exp(ymean)*Param.coefLog;
        yactual = exp(yactual)*Param.coefLog;
    end
    
    z = 1:length(ymean);
    f = [yupper; flip(ylower,1)]; 
    f = fill([z'; flip(z, 2)'], f,...
        'k', ...
        LineStyle = "none",...
        FaceAlpha = 0.3);
    hold on; 
    plot(z, ymean, 'k', LineWidth=1)
    plot(z, yactual, 'r', LineWidth=1)
    legend('{\pm}2\sigma', 'mean', 'actual')

elseif size(ymean, 2) == 1
    % plot(mexp_pred, 'k')
    % hold on
    % plot(mexp_psigma, 'r')
    % plot(mexp_msigma, 'r')
    % plot(C.Qs, 'b', 'LineWidth',2)
end

end