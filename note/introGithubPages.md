# GitHub Pages導入方法

## 前提
* GitHubアカウント作成済み
* gitクライアントインストール済み
* githubクライアント(ghコマンド)インストール済み

## 概要
1. [Gitクライアント準備](#1-gitクライアント準備)
2. [リポジトリ作成及びコンテンツ追加](#2-リポジトリ作成及びコンテンツ追加)
3. [サイト公開](#3-サイト公開)
4. [サイトアクセス](#4-サイトアクセス)

## 1. Gitクライアント準備
### 1.1. GitHubに接続するための公開鍵・秘密鍵を作成する
```console
$ ssh-keygen -b 4096 -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/<OSユーザ名>/.ssh/id_rsa): /Users/<OSユーザ名>/.ssh/github_id_rsa[Enter]
Enter passphrase (empty for no passphrase): <任意の文字列>[Enter]
Enter same passphrase again: <任意の文字列>[Enter]
Your identification has been saved in /Users/<OSユーザ名>/.ssh/github_id_rsa.
Your public key has been saved in /Users/<OSユーザ名>/.ssh/github_id_rsa.pub.
The key fingerprint is:
SHA256:******************************************* <OSユーザ名>@<PC名>
The key's randomart image is:
+---[RSA 4096]----+
|*****************|
|*****************|
|*****************|
|*****************|
|*****************|
|*****************|
|*****************|
|*****************|
|*****************|
+----[SHA256]-----+
```

### 1.2. GitHubにアクセスするためのssh設定をする。
「~/.ssh/config」のファイルを以下に設定する。
```text
Host github.com
  HostName github.com
  IdentityFile ~/.ssh/github_id_rsa
  User git
```

### 1.3. 適宜、Gitクライアントの設定をする
以下はおすすめ設定。
```console
$ git config --global user.email <コミットに利用するユーザ名>
$ git config --global user.email <メールアドレス>
$ git config --global core.autocrlf false
$ git config --global core.quotepath false
$ git config --global core.editor vim
$ git config --global core.whitespace cr-at-eol
$ git config --global init.defaultBranch master
```

### 1.4. GitHubに公開鍵を設定する。
GitHubにログインし、以下サイトにアクセスする。  
<https://github.com/settings/keys>

「New SSH key」をクリックし、以下パラメータに値を設定する。

| パラメータ  | 値                                                       |
| ----------- | -------------------------------------------------------- |
| Title       | 任意の文字列                                             |
| Key         | ssh-keygenで生成された「~/.ssh/github_id_rsa.pub」の内容 |

## 2. リポジトリ作成及びコンテンツ追加
### 2.1. ローカルリポジトリ作成
```console
$ mkdir <リポジトリ名>
$ cd <リポジトリ名>
$ git init
$ vim .gitignore
$ git add -A
$ git commit -m "Initial Commit"
```

### 2.2. リモートリポジトリ作成
ローカルリポジトリに移動していることを前提とする。
以下のコマンドは、対話型である。適宜入力する。
リモートリポジトリ(origin)は、後で設定するため設定しない。
```console
$ gh auth login
$ gh repo create
```

### 2.3. ローカルリポジトリからリモートリポジトリにプッシュ
```console
$ git remote add origin git@github.com:<GitHubアカウント名>/<リポジトリ名>.git
$ git push origin master
```

### 2.4. コンテンツとして、ファイルを作成する。
```console
$ vim index.md
```
「index.md」の内容は以下の通り。
```text
Hello. GitHub Pages.
```

### 2.5. GitHubにコンテンツを追加する。
```console
$ git add -A
$ git commit -m "Commit initial contents"
$ git push origin master
```

## 3. サイト公開
GitHubにログインし、以下サイトにアクセス。  
https://github.com/<ユーザ名>/<リポジトリ名>

「サイト上部のタブ[Setting]> メニュー[Pages]」に移動し、「GitHub Pages」の項目を設定する。

## 4. サイトアクセス
ブラウザで以下URLにアクセス。  
https://<ユーザ名>.github.io/<リポジトリ名>

---
