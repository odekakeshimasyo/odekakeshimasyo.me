---
title: Salesforce System.QueryException List has no rows for assignment to SObject
---

Listで検索結果を受取らず、データ1件のみの取得を想定した書き方をすると
検索結果が0件のとき、エラーが発生する。

```
Contact c = [select Id from Contact where Id = '123456789012345678'];
```

> System.QueryException: List has no rows for assignment to SObject

<br>
毎回Listで受取ってsizeチェックをしないといけないらしい

```
Contact contact = null;
List<Contact> contactList = [select Id from Contact where Id = '123456789012345678'];
if (contactList.size() > 0) {
	contact = contactListget(0);
}
```

