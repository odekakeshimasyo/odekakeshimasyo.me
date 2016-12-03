---
title: Salesforce 本番組織からリソースを削除
---

## Eclipseから削除
1. Eclipseで本番組織のプロジェクトを作成する。
1. 削除したいリソース（Apex、Visualforce、Triggerなど）を選択する。
1. DELキーを押す。
1. 長い時間待つ。タイムアウト的な警告が出て、OKしないとちゃんと削除されないのでずっと見てる必要がある。

## 移行ツールで削除
参考 http://help.salesforce.com/apex/HTViewSolution?id=000004460&language=ja

## フォルダ構成:

> - **undeployCode**/
	- classes/
		- 削除したいもの
	- objects/
		- 削除したいもの
	- pages/
		- 削除したいもの
	- triggers/
		- 削除したいもの
	**destructiveChanges.xml**
	package.xml
- ant-salesforce.jar
- build.properties
- **build.xml**


## build.xml (一部)
deployRootをフォルダ階層に合わせる

``` xml
<!--  undeployCode -->
<target name="任意">
	<sf:deploy 
	username="${sf.username}" 
	password="${sf.password}" 
	serverurl="${sf.serverurl}" 
	rollbackOnError="true"
	deployRoot="undeployCode" 
	/>
</target>
```

## destructiveChanges.xml
書き方はpackage.xmlと同じ

``` xml
<?xml version="1.0" encoding="UTF-8"?>
<Package xmlns="http://soap.sforce.com/2006/04/metadata">
	<types>
		<members>XXXController</members>
		<name>ApexClass</name>
	</types>
	<types>
		<members>XXX1Trigger</members>
		<members>XXX2Trigger</members>
		<name>ApexTrigger</name>
	</types>
	<version>30.0</version>
</Package>
```

## package.xml
とりあえず空っぽにしている。

``` xml
<?xml version="1.0" encoding="UTF-8"?>
<Package xmlns="http://soap.sforce.com/2006/04/metadata">
	<version>30.0</version>
</Package>
```

## Eclipseなどでant実行
通常のデプロイ処理ぽくテストクラスの実行とかがコンソールに表示される。



