PostgreSQL pg_dump pg_restore
===

pg_restoreで利用できるアーカイブ形式で出力すると便利

``` sh
pg_dump -Fc mydb > db.dump
```

<br>
db.dumpのスキーマ、データをnewdbデータベースで(再)作成

``` sql
pg_restore --dbname=newdb db.dump
```

<br>
テーブル毎にデータを登録することも可能

``` sh
pg_restore --dbname=newdb --table=newtable --data-only db.dump
```

<br>
アーカイブファイルの中身を参照

``` sh
pg_restore --list db.dump
```

<br>
スキーマのみも可能。インデックスは作成されないけど。

``` sh
pg_restore --dbname=newdb --schema-only db.dump
```

