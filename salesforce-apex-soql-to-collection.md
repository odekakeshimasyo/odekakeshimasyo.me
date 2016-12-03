---
title: Salesforce Apex SOQL結果をコレクションで取得
---

```
// 配列
Contact[] contacts = [select Id, Name from Contact];

// リスト
List<Contact> contacts = [select Id, Name from Contact];

// セット
Set<Contact> contactSet = new Set<Contact>([select Id, Name from Contact]);

// マップ
Map<Id, Contact> contactMap = new Map<Id, Contact>([select Id, Name from Contact]);

// マップ 書き方がちょっと違う
List<Contact> contacts = [select Id, Name from Contact];
Map<Id, Contact> contactMap = new Map<Id, Contact>(contacts);
```

