CSS tableのヘッダを固定してスクロール
===

width, heightを指定する必要がある。

```css
table {width:400px;}
thead {display:table;background-color:#fff;}
th, td {width:200px;}
tbody{overflow-y:scroll;display:block;height:200px;}
```

```html
<table>
	<thead>
		<tr><th>head1</th><th>head2</th></tr>
	</thead>
	<tbody>
		<tr><td>1</td><td>2</td></tr>
		<tr><td>3</td><td>4</td></tr>
		<tr><td>1</td><td>2</td></tr>
		<tr><td>3</td><td>4</td></tr>
		<tr><td>1</td><td>2</td></tr>
		<tr><td>3</td><td>4</td></tr>
		<tr><td>1</td><td>2</td></tr>
		<tr><td>3</td><td>4</td></tr>
		<tr><td>1</td><td>2</td></tr>
		<tr><td>3</td><td>4</td></tr>
		<tr><td>1</td><td>2</td></tr>
		<tr><td>3</td><td>4</td></tr>
	</tbody>
</table>
```


