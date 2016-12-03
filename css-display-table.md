CSS width:"残り全部"の指定
===

親要素が動的のときに、widthの"残り全部"という指定がしずらい。
> ul (100%), li (width:100px), li (width:残り全部;)


ul,li(float:left)では全てのliが100%になるように指定しないとイコールの式にならない。
> ulのwidth(指定値) >= li(width指定) + li(width未指定)

tableタグを使うと出来る。
> tableのwidth(指定値) = td(width指定) + td(width未指定)


横並びの要素を、一方はwidth指定、他方のwidthを残り全部に指定したいとき

``` html
<style>
.width-100 {width:100%;}
.width-100px {width:100px;}
.width-500px {width:500px;}

table {background-color:blue;}
table td {background-color:#fff;}
</style>

<table class="width-500px">
	<tr>
		<td class="width-100px">100px</td>
		<td class="width-100px">100px</td>
		<td>残り全部</td>
	</tr>
</table>
```

３つのtdのうち、
２つのtdをwidth:100px;にすると、
最後のtdのwidthは親要素の残り300pxくらいになる。

<br>
ul,liで使うにはdisplay:table, table-cell を使う。

``` html
<style>
.width-100 {width:100%;}
.width-100px {width:100px;}
.width-500px {width:500px;}

ul {display:table;}
li {display:table-cell; border:1px solid #f00;}
</style>

<ul class="width-500px">
	<li class="width-100px">100px</li>
	<li class="width-100px">100px</li>
	<li>残り全部</li>
</ul>
```

※ li要素にfloatがあたってると崩れる。


