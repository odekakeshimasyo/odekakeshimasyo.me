PostgreSQL CSV 取り込み upsert
===

## COPY文、\COPYコマンド
違いはCSVファイルの場所がサーバかローカルかだけ。

``` sql
COPY table1 FROM '/path/to/table1.csv' WITH CSV;

\COPY table1 FROM '/path/to/table1.csv' WITH CSV;
```

``` sql
COPY table1(id, value) FROM '/path/to/table1.csv' WITH CSV;

\COPY table1(id, value) FROM '/path/to/table1.csv' WITH CSV;
```

## CSVデータでupsertする

table1に既にデータがあるとき、id重複でエラーになる。

``` sql
\copy table1(id, value) FROM '/path/to/table1.csv' WITH CSV HEADER;
```

<br>
テーブルを一つ挟むことでupsertに対応する。
table2はtemporaryなので後始末しなくていい。

``` sql
# table2(一時テーブル、制約なし)作成
CREATE TEMPORARY TABLE table2 AS TABLE table1 WITH NO DATA;

# table2にCSVをインポート
\COPY table2(id, value) FROM '/path/to/table1.csv' WITH CSV HEADER;

# upsert
WITH update_result AS (UPDATE table1 SET id = table2.id, value = table2.value FROM table2 WHERE table1.id = table2.id RETURNING table1.id)
INSERT INTO table1 (id, value) SELECT table2.id, table2.value FROM table2 WHERE table2.id NOT IN (SELECT id FROM update_result);
```

**ただし、大量データだとI/Oが重い。**
LIMITつけて間にチェックポイントを挟むとちょっと違う。

<br>
table2作成の別解。シーケンスや制約まで複製するとCSVが取り込めない。

``` sql
CREATE TEMPORARY TABLE table2 (LIKE table1);

# CREATE TEMPORARY TABLE table2 (LIKE table1 INCLUDING DEFAULTS INCLUDING CONSTRAINTS INCLUDING INDEXES);
# CREATE TEMPORARY TABLE table2 (LIKE table1 INCLUDING ALL);
```

<br>
table2からtable1へのupsertの別解。

``` sql
# table1と紐づくデータをupdate
UPDATE table1 
SET id = table2.id, value = table2.value
FROM table2
WHERE table1.id = table2.id;

# updateし終わったtable2の紐付いてるデータを削除
DELETE FROM table2 
WHERE id IN (SELECT id FROM table1);

# 残ったtable2のデータをtable1へinsert
INSERT INTO table1 (id, value) 
SELECT table2.id, table2.value 
FROM table2 
WHERE id NOT IN (SELECT id FROM table1);
```

