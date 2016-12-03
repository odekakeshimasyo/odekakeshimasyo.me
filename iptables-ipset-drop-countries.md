---
title: iptables ipsetで海外からのアクセスを遮断
---

## インストール

``` sh
yum -y install ipset
```

## iptablesに登録
cn, kr, ruを遮断。
cronで日次で更新すればいいのかな。

``` sh
#!/bin/bash

ZONE_FILE_URL="http://www.ipdeny.com/ipblocks/data/countries"
ipset destroy BLACKLIST
ipset create BLACKLIST hash:net
for IP in $(wget -O - ${ZONE_FILE_URL}/{cn,kr,ru}.zone | grep -v "^#|^$" )
do
  ipset add BLACKLIST $IP
done
iptables -A INPUT -m set --match-set BLACKLIST src -j DROP
```

## 確認
上のshを実行した後に変数が登録されているか確認。

``` sh
ipset list BLACKLIST | less
```

## iptables起動後に自動起動
iptablesを再起動すると、ipsetで設定した内容が削除される。

``` sh
chkconfig ipset on
chkconfig --list ipset
```

