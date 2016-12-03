PostgreSQL vacuum
===

## バキュームが必要かの確認
デッドタプルがどのくらいの割合があるか確認

``` sql
SELECT
	relname,
	n_live_tup,
	n_dead_tup
FROM 
	pg_stat_user_tables 
WHERE relname = 'テーブル名';
```

## 最後に行ったvacuum, autovacuumの日時を確認

``` sql
SELECT
	relname,
	n_live_tup,
	n_dead_tup,
	last_vacuum,
	last_autovacuum
FROM pg_stat_all_tables
WHERE relname = 'テーブル名';
```

## バキュームの実行ログを出力して頻度を確認
ログレベルをDEBUG2にしなくてもバキュームの実行ログが出力できる。
設定値（ミリ秒）以上時間がかかったとき
> log_autovacuum_min_duration = ミリ秒
-1は非表示、0は全て表示。


バキュームの実行
VACUUM文で行う場合

``` sql
VACUUM (ANALYZE) テーブル名;
```
<br>
vacuumdbコマンドで行う場合

``` sh
/usr/local/pgsql/bin/vacuumdb --analyze --table 'テーブル名' bkdb
```
テーブル名は文字列で渡す。
バキューム＋アナライズは --analyzeオプションをつける。


## パラメータ調整して1回のVACUUMの負荷を軽減してみる
autovacuum_vacuum_cost_limitを調整してみる。
デフォルトは-1(vacuum_cost_limit=200が適用される)

普段はautovacuumをOFFにして、
一回あたりのバキュームの負荷を気にしながら手動でバキュームを行いたい場合を考えてみた。
vacuum_cost_limitを限りなく小さくする。
一度VACUUMが走り出したらキリのいいところまで止まってくれないからか。。

``` sh
psql -f 'vacuum.sql' データベース名;
```
<br>
vacuum.sql

``` sql
set vacuum_cost_limit=10; # セッション中のみ適用
vacuum analyze テーブル名1;
vacuum analyze テーブル名2;
vacuum analyze テーブル名3;
```

## PostgreSQLの現在の設定の確認

``` sql
show all;
show <設定パラメータ>;
```

## 設定の動的反映
サービス中でも再起動を行わずに設定を動的に反映する（再起動が必須な設定項目もある）

まずpostgresql.conf で反映したい設定に変更。
設定後、以下を実行する。

``` sh
pg_ctl reload
```


