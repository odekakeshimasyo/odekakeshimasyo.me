---
title: Salesforce デプロイ
---

1. Salesforceのデプロイは常に上書き更新。<br>項目やクラスやトリガ等の削除は、移行ツールでdestructiveChanges.xmlで削除する。<br>
1. デプロイ中、Salesforceサーバからレスポンスがないせいかant実行中にエラーになることがあるが、<br>Salesforce上では処理が成功している場合もある。<br>
1. SalesforceのバージョンがProductとSandboxで異なる状態(Summer14とかWinter14など)でリリース接続でデプロイしようとすると、失敗する。<br>
1. トリガのコードカバー率が0％のものが一つでもあると、Productのリリースに失敗する。<br>
1. ジョブ実行中のデプロイはロックエラーになることもある。

