---
title: Salesforce Apex MAC(メッセージ認証コード)生成
---

MD5, SHA1, SHA256, SHA512が指定できる。

```
Blob mac = Crypto.generateMac('MD5', Blob.valueOf(inputStr), Blob.valueOf('your_signing_key'));
String macUrl = EncodingUtil.urlEncode(EncodingUtil.base64Encode(mac), 'UTF-8');
```

