---
title: Salesforce URLパラメータを取得
---

<br/>
Apexで取得

```
String name = ApexPages.CurrentPage().getParameters().get('name');
```

<br/>
Visualforceで取得

```
{!$CurrentPage.parameters.name}
```

<br/>
テストクラスなどでパラメータを仕込みたいとき

```
ApexPages.CurrentPage().getParameters().set('name', 'abcde');
```

