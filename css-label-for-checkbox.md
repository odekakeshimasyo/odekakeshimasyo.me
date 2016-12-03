CSS トグルボタン(スタイル切り替え)
===

ボタンを押すことで、チェックボックスのON/OFFが切り替わるので(label@for)
それに合わせてスタイルを定義する。

``` css
#button {display:block;width:100px;height:20px;background-color:pink;}

#toggle {display:none;}

#toggle:checked + #list {display:none;}
```

``` html
<label id="button" for="toggle">ボタン</label>

<!-- ボタンのON/OFF状態を保持 -->
<input type="checkbox" id="toggle" name="toggle"></input>

<ul id="list">
	<li>item1</li>
	<li>item2</li>
	<li>item3</li>
</ul>
```

隣接セレクタ(+)じゃなくて、
間接セレクタ(~, CSS3)を使えばもっと広範囲でスタイルの切替が出来る。


