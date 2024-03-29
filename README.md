# 2023_mt_ks

## 概要
ガウス過程回帰を用いたパルス数に基づく流砂料推定.

## インストール方法
とくになし

## Dependencies

This project depends on the following libraries and tools:

- **GPML**: GPML toolbox 

You can download from https://github.com/alshedivat/gpml.

tutorial: http://gaussianprocess.org/gpml/code/matlab/doc/

## `.gitignore`で除外されている重要なファイル/ディレクトリ

### `data` ディレクトリ
- **概要**: `data` ディレクトリには, プロジェクトで使用されるデータファイルが含まれています.
- **理由**: データファイルは大きいため, または機密性があるため, Gitで追跡されません.
- **セットアップ**: このディレクトリはプロジェクトの実行に必要です.

### `res` ディレクトリ
- **概要**: `res` ディレクトリには, プロジェクトの解析結果が含まれています. 
- **理由**: これらのファイルはサイズが大きく, または機密性があるため, Gitでの追跡は行いません. また, これらは
プロジェクトのソースコードから再生成可能です. 
- **構成**:

### `config.m` ファイル
- **概要**: `config.m`ファイルは, リポジトリ内のMATLABプロジェクトやスクリプトのユーザー固有の設定を管理するために使用されます.
- **理由**: このファイルには環境固有の設定や機密情報が含まれており, Gitリポジトリでの追跡から除外されています. 
- **セットアップ**: 新しい開発者は, `config_sample.m`（プロジェクト内にあるサンプルファイル）をコピーして`config.m`という名前で同じディレクトリに保存し, 自分の環境に合わせて内容を編集する必要があります.このファイルはプ
ロジェクトのルートディレクトリに置く必要があります.


### `parameter.m` ファイル
- **概要**: `parameter.m`ファイルは, プロジェクトの実行に必要なパラメータを定義しています.
- **理由**: このファイルには環境固有の設定や機密情報が含まれており, Gitリポジトリでの追跡から除外されています. 
- **セットアップ**: 新しい開発者は, `parameter_example.m`（プロジェクト内にあるサンプルファイル）をコピーして`parameter.m`という名前で同じディレクトリに保存し, 自分の環境に合わせて内容を編集する必要があります.このファイルはプ
ロジェクトのルートディレクトリに置く必要があります.

## 基本的な使いかた
1. 初期化.
```run init.m```

2. パラメタを設定する.
```edit parameter.m```

3. main.mを実行する.
```run main.m```

## ハイパーパラメータの学習
#TODO

## 予測の実行
1. 予測したいデータをdataディレクトリに入れる. 予測したいデータはmat形式で保存する. 
`ipsdataExcel2mat.m`関数を用いて, エクセルデータをmat形式に変換することができる. 

例えば, `data/raw/2023_mt_ks_1.xlsx`を`data/raw/2023_mt_ks_1.mat`に変換する場合, 

```ispsdataExcel2mat('data/raw/2023_mt_ks_1.xlsx', 'data/raw/2023_mt_ks_1.mat')```

とする. このとき, エクセルデータのカラムは以下のようになっている必要がある. Qs, Dsは無くても空列をいれること. 

| date            | Qs            | Ds | ips10 | ips9 | ips8 | ips7 | ips6 | ips5 | ips4 | ips3 | ips2 | ips1 |
| --------------- | ------------- | -- | ----- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 2016/06/25 1:01 | 0             |    | 334   | 180  | 87   | 31   | 13   | 5    | 3    | 2    | 1    | 1    |
| 2016/06/25 1:02 | 2.0202E-05    |    | 407   | 226  | 121  | 68   | 34   | 16   | 6    | 3    | 2    | 2    |
| 2016/06/25 1:03 | \-5.05051E-06 |    | 379   | 176  | 79   | 28   | 12   | 8    | 5    | 2    | 2    | 1    |

2. パラメタに（必用最低）以下を設定. 
- `Param.isprediction = true`; 
- `Param.hyp = 'res_public/h.mat`';
- `Param.predictData = 'data/processed/C.mat'`; % 上記で作成したmatファイル
- `Param.ParamNorm = 'res_public/ParamNorm.mat'`;
- `Param.outputExcel = true`; % エクセルファイルに出力するかどうか
- `Param.outputExcelPath  = 'res/prediction/C.xlsx'`; % 出力先のパス

3. main.mを実行する.
```run main.m```



## データのメモ
- 