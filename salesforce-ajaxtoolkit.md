---
title: Salesforce Ajax Toolkit
---

## ライブラリを読み込む

Visualforce

``` html
<script src="/soap/ajax/31.0/connection.js" type="text/javascript"></script>
```

カスタムボタン

```
{!REQUIRESCRIPT ("/soap/ajax/31.0/connection.js")} 
```

## 引数

```
{!CustomObject__c.Id}
```

## 検索 (SOQL)

``` js
sforce.connection.query("Select Id, Name, Industry From Account order by Industry",{
    onSuccess: funtion(queryResult, source){},
    onFailure: function(error, source){},
    source: { output: ???, startTime : new Date().getTime() }
});
```

## 検索 (SalesforceIDで検索)

``` js
var sobjects = sforce.connection.retrieve("Id,Name", "CustomObject__c", ['{!CustomObject__c.Id}']);
for (var i=0; i < sobjects.length; i++) {
  alert(sobjects[i].Name);
}
```

