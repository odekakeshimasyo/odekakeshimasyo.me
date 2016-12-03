---
title: Salesforce System.TypeException
---

## System.TypeException: DML on generic List<SObject> only allowed for insert, update or delete

upsert は配列, Listには使えない。
これはエラーになる。

```
List<sobject> ls = new List<sobject>();
 ...
upsert ls;
```

