---
title: Salesforce DataloaderCLIq
meta.keywords: dataloader cliq,dataloadercliq
---
EXTRACT, INSERT, UPDATE, UPSERT, DELETEがバッチで処理出来る。
Salesforce公式の製品ではない。

参照: https://code.google.com/p/dataloadercliq/


## javaをインストール

``` java
yum install java-1.7.0-openjdk
```

## CLIqの最新版を取得
https://code.google.com/p/dataloadercliq/downloads/list

```
cd /path-to/

wget https://dataloadercliq.googlecode.com/files/cliq-2.3.0.zip

unzip cliq-2.3.0.zip  (/path-to/cliqが作成される)
```

## dataloader-XXX.jarを取得
1. Windows版データローダをインストールする
2. インストールディレクトリにdataloader-XXX.jarが入っている。
3. コピーして /path-to/dataloadercliq/ に配置する。


## cliq.propertiesの編集

``` properties
sfdc.username=ログインID
sfdc.password=パスワードとセキュリティトークンをつなげた文字列
# sfdc.endpoint=sandbox
```
Sandboxに接続したいときは sfdc.endpoint のコメントアウトを外す



## プロセス作成

``` sh
sh /path-to/cliq/cliq.sh
```

実行すると質問をされるので答えていく。

``` sh
#########################################################
Step 1
Choose Operation
#########################################################
1. EXTRACT
2. EXTRACT_ALL
3. INSERT
4. UPDATE
5. UPSERT
6. DELETE
7. HARD_DELETE
Operation number?
```

``` sh
Enter the name of your process:
```
ここで入力した名前のフォルダが /path-to/cliq/cliq_process 配下に作成される。

質問が終わると実行shが作成されている。

> /path-to/cliq/cliq_process/***case_extract***/***case_extract***.sh


## EXTRACTプロセス
> /path-to/cliq/cliq_process/case_extract/**process-conf.xml**

SOQLなどが記載されている。
Salesforce公式のprocess-conf.xmlと同様の設定が出来る。
https://help.salesforce.com/apex/HTViewHelpDoc?id=loader_params.htm&language=ja
<br/>

実行shを実行すると、下記フォルダにCSVが出力される。
> /path-to/cliq/cliq_process/case_extract/**write**/


## INSERT, UPDATEなどのプロセス

プロセス名に合わせてCSVファイルを設置する。
> /path-to/cliq/cliq_process/***case_update***/read/***case_update***.csv

<br/>
sdlファイルはCSVのカラムとSalesforceの項目のマッピング表。
> /path-to/cliq/cliq_process/***case_update***/config/***case_update.sdl***

``` properties
# CSVのカラム=Salesforceの項目名
ID=Id
value1=value1__c
value2=value2__c
```

