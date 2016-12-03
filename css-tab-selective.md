CSS タブ切替
===

選択状態のタブがボーダーの上にくるように、
ネガティブマージンで要素をズラす。

``` css
ul.tabs {
	border-bottom: 3px solid #ddf;
}

ul.tabs:after {
	content:".";
	display:block;
	height:0;
	clear:both;
	visibility:hidden;
}

ul.tabs li {
	width:200px;
	height:100px;
	float:left;
	text-align:center;
	background-color:#fff;
	border:3px solid #ddf;
	border-bottom:none;
	margin-right:30px;
}

ul.tabs li.select {
	margin-bottom: -3px;
	padding-bottom: 3px;
}
```

``` html
<ul class="tabs">
<li class="select">tab1</li>
<li>tab2</li>
<li>tab3</li>
</ul>
```


