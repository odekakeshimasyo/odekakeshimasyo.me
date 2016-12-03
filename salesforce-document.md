---
title: Salesforce ファイル保存 Document
---

## ApexからDocumentオブジェクトにファイルを添付して保存する

``` java
// フォルダは作ってある前提
Folder f = [SELECT id FROM Folder WHERE Type = 'Document' AND Name = '任意のフォルダ名' LIMIT 1];

insert new Document (
		Name = 'ドキュメント名',
		FolderId = f.Id,
		Body = Blob.valueOf('ファイルの中身'),
		Type = 'txt' // 拡張子になる
	);
```

