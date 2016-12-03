---
title: Salesforce Apex Savepointの指定
---

ロールバックする際、予め設定しておいたSavepointを指定することで、Savepointした状態までデータをロールバックすることが出来る。

```
// [1] savepointの指定
Savepoint sp = Database.setSavepoint();

// [2] データの更新
update account;

// savepointを指定することで、[1]のデータの状態までロールバック
Database.rollback(sp);
```

