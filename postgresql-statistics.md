PostgreSQL テーブルやインデックスのサイズSQL
===


## テーブルサイズ

``` sql
SELECT relname, pg_size_pretty ( pg_relation_size(relname::text) ) AS size
FROM pg_class
INNER JOIN pg_namespace ON pg_class.relnamespace = pg_namespace.oid AND pg_namespace.nspname = 'public';
```

``` sql
select pg_relation_size('テーブル名') as テーブル名, pg_relation_size('テーブル名') as テーブル名;
```

``` sql
select pg_table_size('テーブル名') as テーブル名, pg_table_size('テーブル名') as テーブル名; 
```

> pg_relation_size() = pg_table_size() + pg_indexes_size()


## データベースサイズ

``` sql
select pg_database_size('データベース名'); 
```


## インデックスサイズ

``` sql
select pg_indexes_size('テーブル名') as テーブル名, pg_indexes_size('テーブル名') as テーブル名;
```


## コミット数、ロールバック数

``` sql
SELECT datname, xact_commit, xact_rollback FROM pg_stat_database; 
```

