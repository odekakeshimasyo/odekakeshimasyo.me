PostgreSQL idleプロセス開放
===

- 全体的に処理が重いとき
- メモリを食っているとき
- psコマンドでpostgresqlのプロセスが大量にあるとき


## idleになっているプロセスを確認 

``` sql
SELECT * FROM pg_stat_activity;
```
pg_stat_activity.current_queryカラムに"IDLE", "IDLE in transaction"と表示されている場合はアイドルしている。(瞬間的なものはよくある)
"IDLE"は接続しているだけでアイドルしている状態、
"IDLE in transaction"はトランザクション中でアイドルしている状態。


## idleになっているプロセスを開放する
クエリのキャンセルを行う。プロセスIDは pg_stat_activity.procpidカラムか、psコマンドのPID。

``` sql
SELECT pg_cancel_backend(プロセスID);
```
<br>
クエリの中止を行う。

``` sql
SELECT pg_terminate_backend(プロセスID);
```

<br>
上記で止まらないときは、killする

``` sh
kill プロセスID
```

