---
title: Salesforce 設計 論理削除
---

削除ボタン（カスタムボタン）、ビュー（一覧表示）を使って、
Apex無しで、ユーザーに物理削除をさせないようにする。

## 削除ボタン（詳細画面用）を作成する

``` js
{!REQUIRESCRIPT ("/soap/ajax/31.0/connection.js")}

if (!confirm('このデータを削除しますか？')) {
	var custom = new sforce.SObject("Custom__c");
	custom.Id = '{!Custom__c.Id}';
	custom.IsDeleted__c = true;
	var result = sforce.connection.update([custom]);

	if (!result[0].getBoolean("success")) throw "削除できませんでした";

	window.location.reload();
}
```

## 削除リンク（一覧ビュー用）を作成する

``` js
{!REQUIRESCRIPT ("/soap/ajax/31.0/connection.js")}

var records = {!GETRECORDIDS( $ObjectType.Custom__c )};
if (records == null || records.length == 0) throw 'チェックされていません';

if (confirm('選択したデータを削除しますか？')) {

	var customs = [];
	for (var i=0; i < records.length; i++) {
		var custom = new sforce.SObject("Custom__c");
		custom.Id = records[i];
		custom.IsDeleted__c = true;
		customs.push(custom);
	}

	// 更新
	if (customs.length != 0) {
		var results = sforce.connection.update(customs);

		for (var i=0; i < results.length; i++) {
			if (!results[i].getBoolean("success")) throw "削除できなかったデータが存在します。";
		}
		
		window.location.reload();
	}
}
```

## レイアウトに配置する
削除ボタンはページレイアウト、削除リンクは検索レイアウトで配置する。
デフォルトの削除ボタン、削除リンクは表示しないように権限を取ってしまう。

## ビュー（論理削除用）を作成する。
"新規ビューの作成"から、検索条件の絞り込みで、
 "削除フラグがFalseと一致する" 条件を設定して、ビューを作成する。

普段ユーザーにはこのビューを使ってもらう。もしくは他のビューは権限で隠す。


