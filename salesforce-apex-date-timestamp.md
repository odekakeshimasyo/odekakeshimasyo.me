---
title: Salesforce Apex 日付 時間
---

## Datetime.now()は日本時間じゃない
Datetime.now()はGMT。
Datetime.now().format()、 Datetime.now().format('yyyy-MM-dd', 'JST')で日本時間に変換できる。

## SOQLに指定する日付フォーマット
Salesforceの日付は全部GMT。
*YYYY-MM-DD*
*YYYY-MM-DD*T*HH:mm:ss*Z
*YYYY-MM-DD*T*HH:mm:ss.SSS*Z

日本時間は
*YYYY-MM-DD*T*HH:mm:ss*+09:00

## データローダで日付を登録すると一日前の日付になる
https://help.salesforce.com/HTViewSolution?id=000047804&language=ja
この動きは仕様

