PostgreSQL 日付
===

## 今日

``` sql
select current_date;
select date 'today';
select timestamp 'today';
// select current_date + '-1 days'; // エラーになる
```


## 昨日

``` sql
select current_date - 1;
select date 'yesterday';
select timestamp 'yesterday'; // 時間は00:00:00
select now() + '-1 days';
```

## 明日

``` sql
select current_date + 1;
select date 'tomorrow';
select timestamp 'tomorrow';
select now() + '1 days';
```

## 7日前

``` sql
select current_date - 7;
select current_timestamp - 7;
select current_timestamp + '-7 days';
```


