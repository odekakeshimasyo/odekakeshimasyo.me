---
title: Salesforce レポート 検索条件 "次の文字列を含む"
---

## 検索条件"次の文字列を含む"は、<br>ロングテキストエリアの_先頭から255文字まで_しか<br>検索できない

256文字以降は、指定文字が含まれていても、そのデータはレポートに出力されない。
http://www.salesforce.com/us/developer/docs/soql_sosl/Content/sforce_api_calls_sosl_find.htm

但し、カスタム項目のみ。
標準項目のロングテキストエリアは全文が検索対象。
<br>
普段はカスタム項目で、検索対象にしたいものはトリガで標準項目に突っ込む設計にしないと使えない。

