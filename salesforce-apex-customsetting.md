---
title: Salesforce Apex カスタム設定
---
## カスタム設定値の取得/変更

Salesforce画面から[設定]-[開発]-[カスタム設定]でカスタム設定、カスタム項目を追加する。
一度追加したカスタム項目に初期値として適当な値も登録する。
（登録しないと階層型だとNullPointerExceptionが出る）

|設定種別|階層|
|---|---|
|カスタム設定のAPI参照名|CustomSetting__c|
|カスタム項目のAPI参照名|Item__c|

## Apexからカスタム設定値を参照

```
// ユーザ毎の値を保持した設定オブジェクト
CustomSetting__c setting = CustomSetting__c.getInstance();

// デフォルト値を保持した設定オブジェクト
CustomSetting__c orgDefaultSetting = CustomSetting__c.getOrgDefaults();

// 空オブジェクト
CustomSetting__c newSetting = new CustomSetting__c();

// カスタム設定のカスタム項目値の取得
String item = setting.Item__c;
// setting.get('Item__c');

// カスタム設定に値を設定
setting.Item__c = value;
// setting.put('Item__c', value);

// カスタム項目値の更新
setting.Item__c = 'update string';
update setting;
```


## 設定種別がリストの場合
|設定種別|リスト|
|---|---|
|カスタム設定のAPI参照名|CustomSetting__c|
|カスタム項目のAPI参照名|Item__c|

## Apexからカスタム設定値を参照

```
// Map
Map<String, CustomSetting__c> settingMap = CustomSetting__c.getAll();

// 登録データ一覧
for (String key : settingMapkeySet()) {
	System.debug('' + key + ': ' + settingMap.get(key));
}
```


## テストクラス実行時にgetInstance()しようとするとnullになる場合

テスト実行時はデータが何も入っていない状態で実行される。
そのため、テスト実行前にテスト用の設定データもinsertする必要がある。

カスタム設定の値もデータとして扱われるため、テスト処理を実行する前にinsertする必要がある。

```
// カスタム設定の初期化
CustomSetting__c setting = new CustomSetting__c();
setting.Item__c = 'テストテスト';
insert setting;

/*
 * テスト開始
 */
Test.startTest();

// 取得できる
CustomSetting__c setting = CustomSetting__c.getInstance();

Test.stopTest();
```

