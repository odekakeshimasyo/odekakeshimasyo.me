---
title: Salesforce Visualforce
---

## apex:selectRadio  
ラジオボタンを表示する。

``` xml
<apex:selectRadio value="{!lead.Post__c}">
	<apex:selectOptions id="Post" value="{!postSelectOptions}" />
</apex:selectRadio>
```
lead.Post__c (選択リスト)
postSelectOptions (List\<SelectOption\>)


## apex:selectCheckboxes
複数チェックボックス

``` xml
<apex:selectCheckboxes value="{!lead.Industry__c}">
	<apex:selectOptions id="Industry" value="{!industrySelectOptions}" />
</apex:selectCheckboxes>
```
lead.Industry__c (複数選択リスト)
industrySelectOptions (List\<SelectOption\>)


## apex:selectList, apex:selectOption
選択リスト　プルダウン　セレクトボックス 

``` xml
<apex:selectList value="{!lead.State}">
	<apex:selectOption itemValue="北海道" itemLabel="北海道"/>
	<apex:selectOption itemValue="青森県" itemLabel="青森県"/>
	<apex:selectOption itemValue="岩手県" itemLabel="岩手県"/>
</apex:selectList>
```

``` xml
<apex:selectList multiselect="false" size="1" value="{!lead.State}">
	<apex:selectOptions value="{!selectOptions}" />
</apex:selectList>
```

<br>
Controllerの変数で動的にプルダウンを作成する。

``` xml
<apex:selectList multiselect="false" size="1" value="{!state}">
	<apex:selectOptions value="{!selectOptions}" />
</apex:selectList>
```

``` java
String state {get;set;}
List<SelectOption> selectOptions {get;set;}
...
selectOptions = new List<SelectOption>();
selectOptions.add(new SelectOption('hokkaidou', '北海道'));
selectOptions.add(new SelectOption('aomori', '青森'));
selectOptions.add(new SelectOption('iwate', '岩手'));
```
<br>
選択リストの内容でプルダウンを作成する。

``` java
List<PicklistEntry> picklist = Contact.LeadSource.getDescribe().getPicklistValues();

for (PicklistEntry p : picklist) {
	if (p.isActive()) {
		selectOptions.add(new SelectOption(p.getValue(), p.getLabel()));
	}
}
```


## apex:stylesheet, apex:includeScript
VisualforceでJavascript/CSS外部ファイルの読み込む。

``` xml
<apex:stylesheet value="{!URLFOR($Resource.resourcename,'style.css')}"/>
<apex:includeScript value="{!URLFOR($Resource.resourcename,'jquery-1.8.0.min.js')}" />
```

## URLFOR($Resource.resourcename, 'filepath')
静的リソースへのURLパスを表示する。

``` xml
<script type="text/javascript" src="{!URLFOR($Resource.リソース名,'フォルダ名/jquery.js')}"></script>
```
<br>
変数に取ればキレイになる。

``` xml
<apex:variable var="resource" value="{!URLFOR($Resource.リソース名,'フォルダ名')}"/>
<link type="text/css" href="{!resource}/style.css">
<script type="text/javascript" src="{!resource}/jquery.js"></script>
```

CSS内の画像パスには気をつける。

## $Page
Visualforceページへアクセスするためのグローバル変数。

``` xml
<apex:commandButton value="XxxConfrim"
    action="{!URLFOR($Page.XxxConfrim)}" />
```

## JSENCODE(string)
Javascript文字列のエスケープを行う。

``` js
var escaped = '{!JSENCODE(string)}';
```

## JSINHTMLENCODE(string)
Javascript文字列のエスケープを行う。
JSENCODEの前にHTMLENCODE(string)も行う。
> JSENCODE(HTMLENCODE((someValue))

## TEXT(primitive)
Visualforceで数値を表示すると 1.0 とか 2.0 で表示されてしまう。
apex:repeat内で整数に丸める。

``` xml
<apex:variable var="index" value="{!0}" />
<apex:repeat value="{!xxxList}" var="xxx">
	<apex:variable var="index" value="{!index+1}" />
	{!TEXT(index)}回目の表示
	...
</apex:repeat>
```

## Visualforce上でMapを使う

こんな書き方が出来る。

``` xml
<apex:outputText value="{!valueMap[key]}" />
```

但し、存在しないキーを指定した場合、問答無用でエラーになる。
nullチェックも出来なさそう。
自作コンポーネント作ったほうがよい。
http://www.salesforce.com/us/developer/docs/pages/index_Left.htm#StartTopic=Content/pages_dynamic_vf_maps_lists.htm?SearchType=Stem

## 配列のリクエストパラメータを使いたいとき
Controllerで配列の変数を定義する。
あとnullだと変数にマッピング出来ないせいかApex関数まで処理が行かないので初期化する。

``` java
public class XXXController {
	public String[] values {get;set;}
	
	public XXXController() {
		values = new String[]{};
	}
}
```

``` xml
<apex:form id="xxxForm">

    <apex:selectCheckboxes id="Value" value="{!values}" layout="pageDirection">
        <apex:selectOptions value="{!valueOptions}" id="ValueOption" />
    </apex:selectCheckboxes>

    <apex:commandButton action="{!submit}" id="SubmitButton" />
</apex:form>
```

