---
title: Salesforce Non-selective query
---

## System.QueryException: Non-selective query against large object type (more than 100000 rows). Consider an indexed filter or contact salesforce.com about custom indexing.

> caused by: System.QueryException: Non-selective query against large object type (more than 100000 rows). Consider an indexed filter or contact salesforce.com about custom indexing.
> Even if a field is indexed a filter might still not be selective when:
> 1. The filter value includes null (for instance binding with a list that contains null)
> 2. Data skew exists whereby the number of matching rows is very large (for instance, filtering for a particular foreign key value that occurs many times)

10万件超えているオブジェクトに対してトリガ内で、カスタム項目を条件にしたSELECT文を発行するとエラーになる。
Name等の管理者項目を条件にすると回避できる。

SOQLのWhere句に指定している条件で
カスタム項目に外部IDを設定すると内部インデックスが作成されるぽく、
10万件超えてもエラーが出なくなる。
http://www.salesforce.com/us/developer/docs/apexcode/Content/langCon_apex_SOQL_VLSQ.htm

日本語の記述
> トリガ中で10万件以上のレコードを含んだオブジェクト中で絞り込み効果の低いクエリを利用した場合は、エラーが発生します。回避するには、WHERE句にインデックス化された項目を含めるようにしてください。
http://blogjp.sforce.com/files/apex_gov_limits_ja172_2.htm

1オブジェクトに外部IDの指定は3つまで。

