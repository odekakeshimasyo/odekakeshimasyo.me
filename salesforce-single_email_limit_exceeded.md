---
title: Salesforce SINGLE_EMAIL_LIMIT_EXCEEDED
---

## caused by: System.EmailException: SendEmail failed. First exception on row 0; first error: SINGLE_EMAIL_LIMIT_EXCEEDED, Failed to send email

メール送信数が最大数まで達してしまったらエラーになって、それまでの処理も全部ロールバックしてしまうので、
制限に達したらメールは送らないようにする。

メール送信数

```
Limits.getEmailInvocations()
```

メール最大送信数
```
Limits.getLimitEmailInvocations()
```

```
List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
...
if (Limits.getEmailInvocations() < Limits.getLimitEmailInvocations()) Messaging.sendEmail(messages);
```

