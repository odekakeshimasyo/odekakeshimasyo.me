---
title: bash
---

|説明|例|
|---|---|
|if文|[ -e $file] && echo "$file exist."|
|if文|[ -e $file] && echo "$file exist." &#124;&#124; echo "not exist."|
|if文|if [ -e $file ]; then<br>  echo "$file is exist."<br>else<br>  echo "$file is not exist"<br>fi|
|while文|ls &#124; while read file; do echo $file; done;|
|cron 秒指定|* * * * * for sec in 0 10 20 30 40 50;do sleep ${sec}; echo $sec; done;|
|更新日時が3日以内のファイル|find . -mtime -3|
|更新日時が3日目のファイル|find . -mtime 3|
|更新日時が3日以上前のファイル|find . -mtime +3|
|更新日時が3分以内のファイル|find . -mmin -3|
|更新日時が3分のファイル|find . -mmin 3|
|更新日時が3分以上前のファイル|find . -mmin +3|
|絶対パス|path=$(cd $(dirname $1) && pwd)/$(basename $1)|
|置換 タブ|sed s/"\t"//g|
|置換 改行|tr '\n' ''|
|変数の展開|sed -e "s/var/$var/g"|
|IPアドレス毎のアクセスランキング|grep -ive "GET /.*&#92;.&#92;(css&#92;&#124;js&#92;&#124;jpg&#92;&#124;gif&#92;&#124;png&#92;&#124;swf&#92;&#124;ico&#92;)&#92; HTTP" access_log &#124; cut -d ' ' -f 1 &#124; sort &#124; uniq -c > access_log.ip|
|時間毎のアクセス|grep -ive "GET /.*&#92;.&#92;(css&#92;&#124;js&#92;&#124;jpg&#92;&#124;gif&#92;&#124;png&#92;&#124;swf&#92;&#124;ico&#92;)&#92; HTTP" access_log &#124; awk '{print $4}' &#124; cut -f2,3 -d: &#124; sort &#124; uniq -c > access_log.time|
|ログ出力|exec >> stdouterr.log 2>&1|
|ログ出力|exec 1> >(tee -a stdout.log)<br>exec 2> >(tee -a stderr.log >&2)|
|ログ出力|{<br>command<br>command<br>...<br>} >> "$LOG" 2>&1|

