---
title: Salesforce INVALID_CROSS_REFERENCE_KEY
---

主従関係項目や参照関係項目に、存在しないSalesforceIdを設定したときに発生する。

```
Contact contact = new Contact();
contact.AccountId = 'dummyID';
insert contact;
```

