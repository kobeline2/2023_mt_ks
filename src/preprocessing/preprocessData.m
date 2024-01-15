function Data = preprocessData(Data, Param)
isUsed = ~isnan(Data.C{1:2073, 7});
Data.C = Data.C(isUsed, :);
Data.X = Data.C{:, Param.Xindex};
Data.y = Data.C{:, Param.yindex};
if Param.logy; Data.y = log(Data.y+0.00001); end

Data = rmfield(Data, "C");

end