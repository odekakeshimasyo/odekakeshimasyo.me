---
title: Salesforce Visualforce PDF出力
---

renderAs="pdf"でPDFページになる。

@pageはVisualforceのheadタグ内に書かないと反映されない。
marginを指定しないとPDF枠いっぱい利用できない。
CSS3は反映されない。:first-childは効くが:nth-childは効かない。:last-childも効かない。
Visualforceで利用できる日本語フォントはArial Unicode MSのみ。

``` html
<apex:page
	renderAs="pdf"
	applyBodyTag="false" 
	applyHtmlTag="false">
<html>
<head>
<style>
@page {size: A4;margin:0px;}
@media print {
    body {font-family: Arial Unicode MS;}
}
</style>
</head>
<body>

</body>
</html>
</apex:page>
```

## VisualforceでPDF出力すると、tdタグ内の文字列が自動改行がされない。
ブラウザなら問題なく自動改行されるのにPDF出力するとされない。文字列がtdのボックスを突き抜ける。
英字、日本語の文字列両方だめ。スペースと日本語と英字の境目くらいしか自動改行されない。
divでもだめ。

文字列を分割してスペース入れればいけそう。
wbrタグを文字列1文字ごとに埋め込むcomponent作ってあてたら自然な改行ぐあいになった。



