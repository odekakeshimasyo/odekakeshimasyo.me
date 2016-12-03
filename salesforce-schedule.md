---
title: Salesforce スケジュール設定
---

## Schedulableインタフェースの実装

``` java
global class SampleSchedule implements Schedulable {
	global void execute(SchedulableContext sc) {
		System.debug('SampleSchedule execute()');
	}
}
```

## Apexからのスケジュール実行

``` java
System.schedule(String JobName, String CronExpression, Object schedulable_class)
```
戻り値はジョブID。

スケジュール実行クラス:

``` java
global class ExecuteSampleSchedule {
	public static void execute() {
		String jobId = System.schedule('SampleSchedule', '0 0 * * * ?', new SampleSchedule());
	}
}
```
引数のCronExpressionはcron形式で指定する。
特殊文字を含めるともっとある。
> 秒(0～59), 分(0～59), 時(0～23), 日(1～31), 月(1～12), 曜日(1～7, 1は日曜日), 年(任意)


## 管理画面からのスケジュール実行
1. [設定]
1. [開発]
1. [Apex クラス]
1. スケジュール実行クラスのページを開く
1. [Apex をスケジュール]ボタン押下
1. スケジュール設定画面で必要なものを入力する。
1. 保存する。

変更・削除は
1. [設定]
1. [監視]
1. [スケジュール済みジョブ]

