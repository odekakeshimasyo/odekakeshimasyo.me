---
title: Salesforce SOQL
---

## 文字列でSOQLを生成するときはエスケープする

ちなみにバインド変数はWhere句にしか使えない。

```
String soql = 'select' + str.escapeSingleQuotes() + 
    ' from ' + sobjectName.escapeSingleQuotes() + 
    ' where id = :id';
```

<br/>
## 日付検索

```
SELECT Id 
FROM Contact 
WHERE LastModifiedDate > 2012-02-26T14:38:09+09:00 
AND LastModifiedDate < 2012-02-26T14:40:47+09:00
```

<br/>
## LAST_N_DAYS 過去n日以内

```
SELECT Id
FROM Contact
WHERE LastModifiedDate < LAST_N_DAYS:3     #3日以内
```

