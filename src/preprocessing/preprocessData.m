function Data = preprocessData(Data, Param)
Data.X = Data.C{:, Param.Xindex};
Data.y = Data.C{:, Param.yindex};
if Param.logy; Data.y = log(Data.y+0.00001); end

Data = rmfield(Data, "C");

end