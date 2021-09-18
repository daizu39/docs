# Linuxにおけるグループの基本

## 環境情報

本環境の情報は以下の通り。

パラメータ         | 値
-------------------|--------------
ユーザ名           | username
グループ名         | groupname
システムグループ名 | sysgroupname

## 用語の説明

gid, uidは、root, Systemとそれ以外のidがある。
「root」のgid, uidは「0」, Systemとそれ以外のid範囲は「/etc/login.defs」で定義されている。

用語 | 説明
-----|-----------------------
gid  | groupが持っているid
uid  | userが持っているid

## 確認コマンド

```console
$ # gid, uidの定義確認
$ cat /etc/login.defs | grep -E "ID"
UID_MIN                  1000
UID_MAX                 60000
#SYS_UID_MIN              100
#SYS_UID_MAX              999
GID_MIN                  1000
GID_MAX                 60000
#SYS_GID_MIN              100
#SYS_GID_MAX              999
$
$ # ログインユーザに対するグループとユーザのuid, gidを確認
$ id
uid=1000(username) gid=1000(username) groups=1000(username),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),116(lxd)
$
$ # ログインユーザに対するグループを確認
$ groups
username adm cdrom sudo dip plugdev lxd
$
$ # 全グループに対するidと所属しているユーザの確認
$ cat /etc/group
root:x:0:
daemon:x:1:
bin:x:2:
sys:x:3:
...abbr...
username:x:1000:
```

## グループの変更方法

```bash
# システム以外のグループ追加
sudo groupadd groupname
# System用グループ追加
sudo groupadd --system sysgroupname
# gid変更
sudo groupmod groupname -g 120
# groupの削除
sudo groupdel groupname
```

## ユーザのグループ変更方法

```bash
# グループ追加
sudo usermod -aG groupname username
# グループ変更
sudo usermod -G username,adm,cdrom,sudo,dip,plugdev,lxd username
```

## ログインしているユーザのグループ再読み込み

```bash
# ログインshellの再起動+ログイン
exec $SHELL -l
```
