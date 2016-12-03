---
title: Salesforce Apex @future
---

## @futureアノテーション
- 非同期処理を行うときに指定する。
- 戻り値無しでstaticである必要があるが、ガバナ制限が緩くなる。
- 非同期処理なので呼び出した順に処理されるかは保証されない。きっとSalesforceの内部キューに入って処理される。
- 指定可能な引数は、プリミティブ、配列、List、Mapのみ。
- SObjectや自作クラスのインスタンスは引数に指定できない。
- 1Apex10個まで、24時間で200回コール制限がある。

## コールアウト
- コールアウト(外部接続)するときはcallout=trueを指定する。
- @future(callout=true)メソッドから@futureメソッドを呼出することはできない。
- テストメソッドでcalloutを実行するとスキップしてしまうので、フラグまたはコールアウト用クラスを作ってテスト処理はモックで実行する。
- コールアウトする前後にDML処理(insert, update, upsert, delete)を挟むとCalloutExceptionが発生する。
> System.CalloutException: You have uncommitted work pending. Please commit or rollback before calling

calloutとDMLの処理の順番によってエラーが発生する。
以下は動作する。
- DML ⇒ callout
- callout ⇒ DML
以下はエラーになる。
- DML ⇒　callout ⇒ DML
- callout ⇒ DML ⇒ callout


