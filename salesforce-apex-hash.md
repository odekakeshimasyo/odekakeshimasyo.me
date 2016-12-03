---
title: Salesforce Apex ハッシュ値生成
---

参考 http://help.salesforce.com/apex/HTViewSolution?id=000003698&language=en_US

MD5, SHA1, SHA256, SHA512が指定できる。

```
String hash = EncodingUtil.convertToHex(Crypto.generateDigest('MD5', Blob.valueOf('文字列')));
System.debug(hash);
```

