CDNダウン時のjs/cssのフォールバック
===

## Javascriptのフォールバック
jqueryは調べればたくさん出てくる。

``` html
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="./jquery.min.js"><\/script>');</script>
```

<br>
他のライブラリも同様の方法で出来る。

``` html
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/highlight.min.js"></script>
<script>window.hljs || document.write('<script src="/highlight.min.js"><\/script>');</script>
```

## CSSのフォールバック 方法1

linkタグでonloadを使う。
ダウンロード出来ればonloadが実行される。失敗すればonloadは実行されない。

``` html
<link rel="stylesheet" onload="window.hljscss = 1;" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/styles/docco.min.css" />
<script>window.hljscss || document.write('<link rel="stylesheet" href="/highlight.docco.min.css" \/>');</script>
```

ちなみに他にもbody, script, style, embed, img, frame, iframe, framesetは、onloadが実行される。
古いブラウザでは実行されないのもある。


## CSSのフォールバック 方法2
関数を自作する。

``` js
<script>
(function($) {
	$(function() {
		if ($('body').css('color') !== '#eee') {
			$('head').prepend('<link rel="text/stylesheet" href="/css/highlight.js.docco.min.css">');
		}
	});
})(window.jQuery);
</script>
```

以下のは[StackOverflow](http://stackoverflow.com/questions/7383163/how-to-fallback-to-local-stylesheet-not-script-if-cdn-fails)に書いてたもの。

``` js
<script type="text/javascript">
$.each(document.styleSheets, function(i,sheet){
	if(sheet.href=='http://code.jquery.com/mobile/1.0b3/jquery.mobile-1.0b3.min.css') {
		var rules = sheet.rules ? sheet.rules : sheet.cssRules;
		if (rules.length == 0) {
			$('<link rel="stylesheet" type="text/css" href="path/to/local/jquery.mobile-1.0b3.min.css" />').appendTo('head');
		}
	}
});
</script>
```

## CSSのフォールバック 方法3
こういうのを使う。
http://fallback.io/
http://yepnopejs.com/


