function C = ipsdataExcel2mat(fn, out)
% function ipsdataExcel2mat(fn)
%   fn: filename of the excel file
%   This function converts the excel file to a mat file for 2023_mt_ks project.

opts = spreadsheetImportOptions("NumVariables", 11);
dataLines = [4, Inf];
opts.DataRange = dataLines(1, :);
% Specify column names and types

opts.VariableNames = ["date",...
                      "ips10", "ips9", "ips8", "ips7", "ips6",...
                      "ips5",  "ips4", "ips3", "ips2", "ips1"];
opts.VariableTypes = ["datetime",...
                      "double", "double", "double", "double", "double",...
                      "double", "double", "double", "double", "double"];

% Import the data
C = readtable(fn, opts, "UseExcel", false);

% add Qs and Ds columns
C.Qs = NaN(height(C),1);
C.Ds = NaN(height(C),1);
columnOrder = {'date', 'Qs', 'Ds',...
               'ips10', 'ips9', 'ips8', 'ips7', 'ips6',...
               'ips5',  'ips4', 'ips3', 'ips2', 'ips1'};
C = C(:,columnOrder);
save(out, "C");

end