---
title: Salesforce DataloaderCLIq データベース接続
---
## Dataloader CLIq実行方法
```sh
#!/bin/sh
export DLPATH="/usr/local/dataloader"
export DLCONF="/usr/local/dataloader/cliq_process/プロセス名/config"
java -cp "$DLPATH/*" -Dsalesforce.config.dir=$DLCONF com.salesforce.dataloader.process.ProcessRunner process.name=プロセス名
```

## Salesforce -> PostgreSQLのupsert

process-conf.xmlの"dataAccess.name"に、database-conf.xmlのbean idを設定する。

```sql
create table test (id text, name text, text1 text, date1 timestamp);
```


process-conf.xml

```xml
<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN" "http://www.springframework.org/dtd/spring-beans.dtd">
<beans>
<bean id="test" class="com.salesforce.dataloader.process.ProcessRunner" singleton="false">
	<description>Created by Dataloader Cliq.</description>
	<property name="name" value="test"/>
	<property name="configOverrideMap">
		<map>
			<entry key="dataAccess.name" value="testQueryData"/>
			<entry key="dataAccess.type" value="databaseWrite"/>
			<entry key="dataAccess.readUTF8" value="true"/>
			<entry key="dataAccess.writeUTF8" value="true"/>
			<entry key="process.enableExtractStatusOutput" value="true"/>
			<entry key="process.enableLastRunOutput" value="true"/>
			<entry key="process.lastRunOutputDirectory" value="/usr/local/dataloader/cliq_process/test/log"/>
			<entry key="process.operation" value="extract"/>
			<entry key="process.statusOutputDirectory" value="/usr/local/dataloader/cliq_process/test/log"/>
			<entry key="sfdc.bulkApiCheckStatusInterval" value="5000"/>
			<entry key="sfdc.bulkApiSerialMode" value="5000"/>
			<entry key="sfdc.debugMessages" value="false"/>
			<entry key="sfdc.enableRetries" value="true"/>
			<entry key="sfdc.endpoint" value="https://test.salesforce.com/services/Soap/u/27.0"/>
			<entry key="sfdc.entity" value="Test__c"/>
			<entry key="sfdc.extractionRequestSize" value="500"/>
			<entry key="sfdc.extractionSOQL" value="select id, name, text1__c, createddate from test__c"/>
			<entry key="sfdc.insertNulls" value="false"/>
			<entry key="sfdc.loadBatchSize" value="100"/>
			<entry key="sfdc.maxRetries" value="3"/>
			<entry key="sfdc.minRetrySleepSecs" value="2"/>
			<entry key="sfdc.noCompression" value="false"/>
			<entry key="sfdc.password" value="***"/>
			<entry key="sfdc.proxyHost" value=""/>
			<entry key="sfdc.proxyNtlmDomain" value=""/>
			<entry key="sfdc.proxyPassword" value="***"/>
			<entry key="sfdc.proxyPort" value=""/>
			<entry key="sfdc.proxyUsername" value=""/>
			<entry key="sfdc.timeoutSecs" value="60"/>
			<entry key="sfdc.useBulkApi" value="false"/>
			<entry key="sfdc.username" value="test@test.com"/>
		</map>
	</property>
</bean>
</beans>
```


database-conf.xml

```xml
<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN" "http://www.springframework.org/dtd/spring-beans.dtd">
<beans>
<bean id="dbDataSource"
      class="org.apache.commons.dbcp.BasicDataSource"
      destroy-method="close">
	<property name="driverClassName" value="org.postgresql.Driver"/>
	<property name="url" value="jdbc:postgresql://localhost:5432/*****"/>
	<property name="username" value="postgres"/>
	<property name="password" value="******"/>
</bean>
<bean id="testQueryData"
      class="com.salesforce.dataloader.dao.database.DatabaseConfig"
      singleton="true">
	<property name="sqlConfig" ref="testQueryDataSql"/>
	<property name="dataSource" ref="dbDataSource"/>
</bean>
<bean id="testQueryDataSql"
      class="com.salesforce.dataloader.dao.database.SqlConfig" singleton="true">
	<property name="sqlString">
		<value>
		with upsert as (update test set name = @name@, text1 = @text1__c@, date1 = @createddate@ where id = @id@ returning id)
		insert into test (id, name, text1) select @id@, @name@, @text1__c@, @createddate@ where not exists (select 1 from upsert);
		</value>
	</property>
	<property name="sqlParams">
		<map>
			<entry key="id" value="java.lang.String"/>
			<entry key="name" value="java.lang.String"/>
			<entry key="text1__c" value="java.lang.String"/>
			<entry key="createddate" value="java.sql.Timestamp"/>
		</map>
	</property>
</bean>
</beans>
```

