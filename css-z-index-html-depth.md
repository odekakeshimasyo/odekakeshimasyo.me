CSS z-indexをHTMLタグ階層の深さで代用
===

z-indexはボックスの重なりの順序。
CSSでz-indexをあてなくても、htmlの階層が深いとz-indexの順序も上に来る。

``` html
<div id="div1"><div>
<div id="div2"><div>
```

<br>
同じ階層だとz-indexが同じため、
ネガティブマージンでdiv1, div2を重ねると、必ずdiv2が上にくる。

``` html
<div>
    <div id="div1"></div>
</div>
<div id="div2"></div>
```

div1を上に上げるためには、div1の階層を深くする。

