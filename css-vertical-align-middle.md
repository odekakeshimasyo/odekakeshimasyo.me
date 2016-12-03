CSS vertical-align:middle
===

vertical-alignはもともとtable tdタグかインライン要素用で、ブロック要素には効かない。

これは有効

``` html
<style>
.etc {
	width:300px;
	height:300px;
	border: 5px solid #f00;
}
.table-cell {
	display:table-cell;
}
.middle{
	vertical-align:middle;
}
</style>

<div class="middle table-cell etc">
	てす てす てす
</div>
```
<br>
子要素にブロック要素を使いたいときは

``` html
<div class="middle table-cell etc">
	<div>てす てす てすと</div>
</div>

<div class="middle table-cell etc">
	<p>てす てす てす</p>
</div>
```
<br>
親要素にfloatがあると、親要素のheightは考慮されないので、
これはうまくいかない

``` html
<style>
.float {
	float:left;
}
</style>
<div class="float middle table-cell etc">
	<div>てす てす てすと</div>
</div>
```
<br>
親要素に display:table を指定する

``` html
<style>
.table {
	display:table;
}
</style>

<div class="table float etc">
	<div class="table-cell middle">てす てす てすと</div>
</div>
```


