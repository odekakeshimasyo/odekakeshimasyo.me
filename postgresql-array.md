PostgreSQL 配列型
===

## カラム定義

``` sql
create table table1 (id serial, items int[]);
```

## データ作成

``` sql
insert into table1 (items) values ('{1, 2, 3, 4}');
insert into table1 (items) values (array[1, 2, 3, 4]);
```

## 演算子

|意味|条件|結果|
|---|---|---|
|配列の一番目(添字は1から)|items[1]|1|
|配列の範囲|items[2:3]|{2,3}|
|nullを挟む|array[1,2,null,4]|{1,2,3,NULL,4}|
|検索結果を配列に変換|array(select id from table1)|{1,2,3, ...}|
|特定の位置で条件指定|items[3] = 3|true|
|配列の中を走査|2 = any(items)|true|
|配列の中を走査|2 = some(items)|true|
|全てを評価|2 = all(items)|false|
||2 = all(array[1])|false|
||2 = all(array[2])|true|
||2 = all(array[1, 2])|false|
||2 = all(array[2, 2])|true|
|完全一致|items = '{1, 2, 3, 4}'|true|
||items = '{1, 2, 4, 3}'|false|
|キャスト|items = '{1, 2, 3, 4}'::int[]|true|
|含む|items @> '{2, 1, 3, 4}'|true|
|含まれる|items <@ '{1, 2, 3, 4, 5, 6}'|true|
|一致するものがある|items && '{1, 5, 6}'|true|
||items && '{5, 6, 7}'|false|
|配列の追加|items &#124;&#124; 5|{1, 2, 3, 4, 5}|
|配列に配列を追加|items &#124;&#124; '{5, 6, 7}'|{1, 2, 3, 4, 5, 6, 7}|


## 関数

|意味|条件|結果|
|---|---|---|
|連結|array_cat(array[1,2], array[3,4])|{1, 2, 3, 4}|
|末尾に追加|array_append(array[1,2], 3)|{1, 2, 3}|
|先頭に追加|array_prepend(array[1,2], 3)|{3, 1, 2}|
|多次元配列の長さを文字列化|array_dims(array[[1,2,3], [4,5,6]])|[1:2][1:3]|
||array_dims(array[[1,2,3], [4,5,6], [7,8,9]])|[1:3][1:3]|
||array_dims(array[[1,2,3,4], [4,5,6,7]])|[1:2][1:4]|
|多次元配列の下限の長さ|array_lower(array[1,2,3], 1)|1|
||array_lower(array[[1,2,3],[4,5,6]], 2)|1|
||array_lower(array[[1,2,3],[4,5,6]], 3)|null|
|多次元配列の上限の長さ|array_upper(array[1,2,3], 1)|3|
||array_upper(array[[1,2,3],[4,5,6]], 2)|3|
||array_lower(array[[1,2,3],[4,5,6]], 3)|null|
|配列を文字列化|array_to_string(array[1,2,3], ',')|1,2,3|
|文字列を配列化|string_to_array('a,b,c', ',')|{a,b,c}|

