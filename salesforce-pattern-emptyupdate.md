---
title: Salesforce 設計 データ空更新でワークフローを動かす
---

別オブジェクトのデータを更新したいときは、
Apex処理を書かないで空更新だけする。

空更新でも更新すればワークフローが評価されるので、
更新したい各項目にワークフローで設定できる。


トリガやControllerでこういうロジックが減る。
項目を追加、変更しても再リリースする必要がない。

``` java
object2.num__c = object1.num__c;
object2.name__c = object1.name__c;
object2.amount__c = object1.amount__c * 100;
```

トリガはこれだけ

``` sql
update [select id from object2 where id = :id];
```

あとはワークフロー項目自動更新で設定する。

