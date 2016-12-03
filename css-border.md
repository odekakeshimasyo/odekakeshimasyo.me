CSS border表示
===

## 隣接セレクタを使う

```css
.list {border:1px solid #aaa;}
.list .item + .item {border-top:1px solid #aaa;}
```

```html
<div class="list">
	<div class="item">AAA</div>
	<div class="item">BBB</div>
	<div class="item">CCC</div>
	<div class="item">DDD</div>
	<div class="item">EEE</div>
</div>
```

## ネガティブマージンで線を重ねる

```css
.item {
	border:1px solid #aaa;
	margin-bottom:-1px;
}
```

```html
<div class="item">AAA</div>
<div class="item">BBB</div>
<div class="item">CCC</div>
<div class="item">DDD</div>
<div class="item">EEE</div>
```

## outlineを使う
outlineはtop, bottom, left, right全ての枠線の表示になる。
topのみbottomのみという指定は出来ない。

```css
.item {
	outline:solid 1px #aaa;
	margin:1px;
}
```

```html
<div class="item">AAA</div>
<div class="item">BBB</div>
<div class="item">CCC</div>
<div class="item">DDD</div>
<div class="item">EEE</div>
```


