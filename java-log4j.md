Java log4j
===

## No appenders could be found for loggerエラー

tomcatでcommons-loggingとlog4jを利用するとWARNが出る。

> log4j:WARN No appenders could be found for logger (org.apache.commons.digester.Digester.sax).
> log4j:WARN Please initialize the log4j system properly.

<br>
システムプロパティにlog4j.configrationを指定すると解決。

```
JAVA_OPTS=-Dlog4j.configuration=file:///path/path/log4j.properties
```
<br>
tomcatのcatalina.propertiesに追加してもいい。

```
log4j.configuration=file://path/path/log4j.properties
```

<br>
または DOMConfigurator, PropertyConfigurator で直接ファイルを読みにいく

log4jはlog4j.propertiesファイルよりlog4j.xmlを優先して読みに行く。
どちらもある場合、log4j.xmlのみ読む。

log4j.xmlを配置した場合は、上記のエラーは出ない。

log4j.xml サンプル:

``` xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE log4j:configuration SYSTEM "log4j.dtd">
<log4j:configuration xmlns:log4j="http://jakarta.apache.org/log4j/" >

	<appender name="file" class="org.apache.log4j.DailyRollingFileAppender">
		<param name="File" value="ucs.log" />
		<param name="DatePattern" value="'.'yyyy-MM-dd" />
		<layout class="org.apache.log4j.PatternLayout">
			<param name="ConversionPattern" value="%d %5p %c{1}:%L - %m%n" />
		</layout>
	</appender>

	<root>
		<priority value ="info" />
		<appender-ref ref="file"/>
	</root>

	<!-- パッケージ毎にログレベルを指定 この設定だとrootの設定と重なって2重にログ出力される -->
	<category name="jp.xxx.xxx">
		<priority value ="debug" />
		<appender-ref ref="file"/>
	</category>

</log4j:configuration>
```

Java側サンプル:

``` java
public class AccountService {
	private static Logger log = Logger.getInstance(AccountService.class);
	
	public void execute() {
		log.info("INFOログ");
	}
}
```


## 速度改善

``` java
if(log.isDebugEnabled()) {
	log.debug("debug log id=" + value);
}
```

