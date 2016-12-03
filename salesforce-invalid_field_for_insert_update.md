---
title: Salesforce INVALID_FIELD_FOR_INSERT_UPDATE
---

## INVALID_FIELD_FOR_INSERT_UPDATE Please check the security settings of this field and verify that it is read/write for your profile or permission set.

こういうときに出る
- 参照、更新権限がないとき
- 数式や主従関係の変更不可な項目を変更しようとしたとき

APIから主従関係の値をセットして更新するとエラーになる。
登録時と同じSalesforceIDなのに。。

値自体を設定してはいけないらしい。トリガも発動する前にエラーになる。

