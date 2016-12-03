---
title: Salesforce 設定画面で出来ること
---

## スケジュールしたいApexクラスが候補に出ないとき
一度Apexクラスの画面を開くと候補に出てくる。。

## ジョブ名はユニークに
ジョブ名さえ違えば、同じクラスでもジョブ登録することができる。
ジョブ名をユニークにしてしまえばいい。
テストクラスでSystem.scheduleを使うときも同様。


## デバッグログが出力されないとき
ログレベルを変更する 
設定 ＞ Apexクラス ＞ ログ設定タブ 

## Apexコードのエラーをメール通知する設定
[設定]⇒[私の個人情報]⇒[個人情報] で 「Apex 警告メールの送信」項目にチェックをする。


## ロケール設定
地域の設定で決まる。
組織全体の設定：　　 設定＞組織プロファイル＞組織情報の"地域のデフォルト値"
各アカウントの設定：　設定＞私の個人情報＞個人情報の"地域"

## データの変更履歴の設定（項目毎）
[設定]⇒[カスタマイズ]⇒オブジェクトを選択⇒[項目]⇒[項目履歴管理の設定]ボタン
画面上のチェックボックスにチェック
履歴管理をする項目にチェックして保存

## Apexプロファイリング ログ設定
Apexプロファイリングのログ設定を行うと、ガバナ制限に対しての利用数が表示される。

> Number of SOQL queries: 30 out of 200
Number of query rows: 4658 out of 50000
Number of SOSL queries: 0 out of 20
Number of DML statements: 15 out of 150
Number of DML rows: 2690 out of 10000
Number of script statements: 404795 out of 1000000
Maximum heap size: 3165501 out of 12000000
Number of callouts: 2 out of 10
Number of Email Invocations: 0 out of 10
Number of fields describes: 0 out of 100
Number of record type describes: 0 out of 100
Number of child relationships describes: 0 out of 100
Number of picklist describes: 0 out of 100
Number of future calls: 0 out of 10


