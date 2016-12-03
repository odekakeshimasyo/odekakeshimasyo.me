PostgreSQL インデックス 再作成
===

PostgreSQLはバキュームしてもインデックスは対象ではなく、最適化されない。
ほっとくと肥大化していき、遅延が発生する

## サイズ確認

インデックス単位

``` sql
pg_relation_size('インデックス名');
```
<br>
テーブル単位

``` sql
pg_indexes_size('テーブル名');
```

## REINDEXコマンドを使う
但しインデックス作成時はテーブルロックしてしまう。

``` sql
REINDEX DATABASE データベース名;
REINDEX TABLE テーブル名;
REINDEX INDEX インデックス名;
```

## CREATE INDEX CONCURRENTLYを使う
ロックはしない。トランザクションのタイミングによってロックがかかることがあるらしいけど。

``` sql
CREATE UNIQUE INDEX インデックス名 ON テーブル名(カラム名);
```

オンラインで再作成するときは、消す前に同じインデックスを作って、リネームして、古いほうを削除する。
いまのところこれで問題は起きていないですが。

``` sql
CREATE INDEX インデックス2 ON テーブル名(カラム名);
BEGIN;
ALTER INDEX インデックス1 RENAME TO インデックス3;
ALTER INDEX インデックス2 RENAME TO インデックス1;
DROP INDEX インデックス3;
COMMIT;
```

## CONSTRAINTの再作成

``` sql
CREATE UNIQUE INDEX CONCURRENTLY インデックス2 ON テーブル名 (カラム名);
BEGIN;
ALTER TABLE テーブル名 DROP CONSTRAINT インデックス, ADD CONSTRAINT インデックス UNIQUE USING INDEX インデックス2;
COMMIT;
```

