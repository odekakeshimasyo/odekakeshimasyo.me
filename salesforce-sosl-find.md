---
title: Salesforce SOSL FIND検索
---

## 全文検索（FIND検索）

```
FIND {SearchQuery} [ toLabel()]
[ IN SearchGroup [ convertCurrency(Amount)] ]
[ RETURNING FieldSpec ]
[ WITH DivisionFilter ]
[ WITH DATA CATEGORY DataCategorySpec ]
[ WITH NETWORK NetworkIdSpec ]
[ LIMIT n ]
[ UPDATE TRACKING ]
[ UPDATE VIEWSTAT ]
```

## 検索結果が異なる？？？

FIND {円} こっちのほうが多くヒットする。こちらのほうが正しいぽい
FIND {"円"}　少ない？
検索結果で"1000円"と"千円"とでヒットするときとしないときがある。

FIND {￥} こっちのほうが多くヒットするがヘンなものもヒットする
FIND {"￥"} または FIND {\￥} こっちが正しいぽい

