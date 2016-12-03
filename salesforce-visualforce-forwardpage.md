---
title: Salesforce Visualforce 画面遷移
---

## apex:commandButtonを使って画面遷移

入力画面⇒確認画面へ遷移する。

Controller:

``` java
public with sharing class XXXController {

	/*
	 *
	 */
	public PageReference index() {
		return Page.XXXIndex;
	}

	/*
	 *
	 */
	public PageReference confirm() {
		return Page.XXXConfirm;
	}

	/*
	 *
	 */
	public PageReference submit() {
		return Page.XXXSubmit;
	}
}
```

入力画面Visualforce:

``` html
<apex:page id="XXXIndex" controller="XXXController" cache="false" showHeader="false" standardStylesheets="false">
<html>
<head></head>
<body>
入力画面
<apex:form id="xxxForm">
	<apex:commandButton value="確認" action="{!confirm}"  />
</apex:form>

</body>
</html>
</apex:page>
```

確認画面Visualforce:

``` html
<apex:page id="XXXIndex" controller="XXXController" cache="false" showHeader="false" standardStylesheets="false">
<html>
<head></head>
<body>
確認画面
<apex:form id="xxxForm">
	<apex:commandButton value="戻る" action="{!index}"  />
	<apex:commandButton value="登録" action="{!confirm}"  />
</apex:form>

</body>
</html>
</apex:page>
```
apex:pageタグでcontentType="none"にすると動かない。

