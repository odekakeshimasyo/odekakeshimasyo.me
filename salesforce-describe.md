---
title: Salesforce Describe
---

## API
[Understanding Apex Describe Information](http://www.salesforce.com/us/developer/docs/apexcode/index_Left.htm#CSHID=apex_dynamic_describe_objects_understanding.htm%7CStartTopic=Content%2Fapex_dynamic_describe_objects_understanding.htm%7CSkinName=webhelp)
[DescribeFieldResult Methods](http://www.salesforce.com/us/developer/docs/apexcode/index_Left.htm#CSHID=apex_methods_system_fields_describe.htm%7CStartTopic=Content%2Fapex_methods_system_fields_describe.htm%7CSkinName=webhelp)

## Describeまわり
|型|取得例|
|---|---|
|[Schema.SObjectType](http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_fields_describe.htm#apex_sobjectype)|Account.sObjectType;|
|[Schema.DescribeSObjectResult](http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_sobject_describe.htm#apex_methods_system_sobject_describe)|Account.sObjectType.getDescribe();|
|[Schema.SObjectField](http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_fields_describe.htm#apex_sobjectfield)|Account.Name;<br/>Account.Name.getDescribe().getSObjectField();|
|[Schema.DescribeFieldResult](http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_fields_describe.htm)|Account.Name.getDescribe();|
|[Schema.DisplayType](http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_fields_describe.htm#apex_displaytype)|Account.Name.getDescribe().getType();|
|[List<Schema.PicklistEntry>](http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_fields_describe.htm#apex_picklistentry)|Account.Industry.getDescribe().getPicklistValues();|

■項目存在チェック

``` java
public Boolean hasColumn(SObject sobj, String columnName) {
	return Schema.getGlobalDescribe().get(sobj.getSObjectType().getDescribe().getName())
			.getDescribe().fields.getMap().containsKey(columnName.toLowerCase());
}
```

