function Data = preprocessData(Data, Param)

Data.X = Data.C{Param.isused, Param.Xindex};
Data.y = Data.C{Param.isused, Param.yindex};
Data = rmfield(Data, "C");

end