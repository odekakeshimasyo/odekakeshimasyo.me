PostgreSQL CSV 出力
===

## COPY文
```sql
COPY テーブル名 TO '/tmp/output.csv' DELIMITER ',';
```
```sql
COPY テーブル名 (カラム1, カラム2, カラム3) TO '/tmp/output.csv' DELIMITER ',';
```
```sql
COPY (SELECT * FROM テーブル) TO '/tmp/output.csv' DELIMITER ',';
```

## psqlコマンド
```sh
psql データベース名 -c "SQL文" -A -F, -t > CSVファイル名
```
```sh
psql データベース名 -f SQLファイル名 -A -F, > CSVファイル名
```
 -A 桁揃えしない
 -F 区切り文字指定
 -t カラム名除去


## SQL文
```sql
SELECT
'"列名"',
'"列名"'
UNION ALL
SELECT
'"' || coalesce(列名, '') || '"',
'"' || coalesce(cast(列名 as text), '') || '"'
FROM
テーブル名;
```

## PostgreSQLのメタコマンド
```sh
psql データベース名 -f meta.sql
```
```sql
\o CSVファイル.csv
\a
\pset fieldsep ','
\pset t

SELECT
'"列名"',
'"列名"'
UNION ALL
SELECT
'"' || coalesce(列名, '') || '"',
'"' || coalesce(cast(列名 as text), '') || '"'
FROM
テーブル名;
\o
```

