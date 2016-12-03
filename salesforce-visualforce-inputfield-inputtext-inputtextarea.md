---
title: Salesforce Visualforce テキストボックス/テキストエリア
---

## apex:inputField
標準オブジェクト、カスタムオブジェクトの項目を指定できる。
指定したオブジェクトの項目の型に合わせてHTMLを出力してくれる。
apex:formタグの中だけ使用可能。

``` xml
<apex:form>
<apex:inputField value="{!contact.name}" />
</apex:form>
```

## apex:inputText
オブジェクトの項目以外にもControllerの変数が指定できる。value属性は必須ではない。

``` xml
<apex:inputText value="{!parameter}" />
```

## apex:inputTextarea
テキストエリアを表示する。apex:formタグの中だけ使用可能。

``` xml
<apex:inputTextarea id="newDesc" value="{!contract.description}"/>
```

