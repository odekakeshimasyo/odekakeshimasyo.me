---
title: Salesforce 移行ツール (Migration Tool)
---

http://www.salesforce.com/us/developer/docs/daas/salesforce_migration_guide.pdf

## salesforce_ant_XXX.zipをダウンロード
1. [設定]
1. [ツール]
1. [Force.com移行ツール]

## 環境構築
1. Eclipseで空プロジェクト作成
1. salesforce_ant_XXX.zipを解凍。
1. ant-salesforce.jarとsampleフォルダの中身をEclipseプロジェクトに突っ込む

|フォルダ|意味|
|---|---|
|codepkg/mypkg|デプロイ用。使い分けが分からない。|
|removecodepkg|削除用。destructiveChanges.xmlに組織から削除したいものを書く。|
|unpackaged|組織から指定したリソースを取得。antのretrieveUnpackagedなどに対応。|


## build.propertiesの設定

プロパティ|意味
---|---
sf.username|Salesforce組織のログインユーザ名
sf.password|Salesforce組織のログインパスワード（セキュリティトークンもあれば追加）
sf.serverurl|Salesforce組織のログイン先。サンドボックスは http://test.salesforce.com

## build.xmlを実行
jarにパスを通して実行する。
既存のものより自分で作ったほうが使いやすい。

|antのtarget|説明|
|---|---|
|test|デプロイして組織から取得する。|
|retrieveUnpackaged|組織からパッケージ以外のリソース取得。|
|bulkRetrieve|全てのリソースを組織から取得。|
|retrievePkg|build.xmlのsf.pkgNameで指定したパッケージのリソースを取得。|
|deployUnpackaged|retrieveUnpackagedで取得したリソースをデプロイ。|
|deployZip|build.xmlのsf.zipFileで指定したzipファイルをリリース。|
|deployCode|codepkgフォルダをリリース。|
|undeployCode|remocecodepkgフォルダの内容を組織から削除。|
|retrieveCode|codepkgフォルダにリソースをダウンロード。|
|deployCodeFailingTest|デプロイ＋全てのテスト実行。|
|deployCodeCheckOnly|デプロイ後の評価だけする。デプロイはされない。|
|listMetadata|build.xmlのsf.metadataTypeで指定したメタデータ情報を取得。|
|describeMetadata|全てのメタデータ情報を取得。|


