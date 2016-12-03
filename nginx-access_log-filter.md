NGINX access_log 特定のログを除外
===

## jpgやgifなど不要なログをaccess_logに出力しない

``` nginx
location / {
	
	if ($uri ~ \.(gif|jpg|jpeg|ico|css|js)$) {
		access_log off;
	}
	
}
```
