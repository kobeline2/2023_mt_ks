%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: /Users/koshiba/Library/Mobile Documents/com~apple~CloudDocs/git/2023_mt_ks/data/raw/202309ハイドロフォン_荷重測定可能のみ_arranged.xlsx
%    Worksheet: メインデータ
%
% Auto-generated by MATLAB on 17-Jan-2024 15:13:00

%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 13);

% Specify sheet and range
opts.Sheet = "メインデータ";
opts.DataRange = "A2:M73";

% Specify column names and types
opts.VariableNames = ["date", "Qs", "Ds", "ips10", "ips9", "ips8", "ips7", "ips6", "ips5", "ips4", "ips3", "ips2", "ips1"];
opts.VariableTypes = ["datetime", "double", "string", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify variable properties
opts = setvaropts(opts, "Ds", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "Ds", "EmptyFieldRule", "auto");

% Import the data
C = readtable("/Users/koshiba/Library/Mobile Documents/com~apple~CloudDocs/git/2023_mt_ks/data/raw/202309ハイドロフォン_荷重測定可能のみ_arranged.xlsx", opts, "UseExcel", false);


%% Clear temporary variables
clear opts