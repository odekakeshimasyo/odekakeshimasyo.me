---
title: Salesforce Javascript Remoting
---

以下のどっちかをつかったほうがいい

``` js
{!$RemoteAction.MyController.getAccount}(
    {'param1':'value1', 'param2':'value2'},
    callbackFunction
);
```

``` js
Visualforce.remoting.Manager.invokeAction(
    '{!$RemoteAction.MyController.getAccount}',
    invocation_parameters,
    callbackFunction
);
```

こっちは使わないほうがいい。名前空間を後からつけることになると面倒だから。

``` js
MyController.method(
    [parameters...,]
    callbackFunction,
    [configuration]
);
```

## Javascript Remotingでコールバック関数でSObjectオブジェクトを処理するとき


Controller:

``` java
global static SObject getSObject(String parameter){
    // ...
    return sobject;
}
```

<br>
Visualforce:

``` js
Visualforce.remoting.Manager.invokeAction(
    '{!$RemoteAction.XController.getSObject}',
    parameter,
    function(sobject, event) {
        var x = sobject['customfield__c'];// ここで名前空間プレフィックスがついてないから値が取れない
    }
);
```

sobject['customfield__c'] と書いてしまうと
パッケージ化したとき名前空間プレフィックスがついてなくて値が取得できないから気をつける。

