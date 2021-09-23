# WindowsでSSHFSを利用しLinuxとファイル共有

## 構成

- Windows
  - File Explorer
  - WSL2(Ubunbu-20.04)
    - sshfsインストール済
- Linux
  - ssh server
    - sftpが利用可能

File Exlplorerから「\\wsl$」にアクセスして、sshfsでマウントしているLinux上のディレクトリにアクセスする。

```text
+-Windows--------------+  +-Linux----------------+
|-File Explorer        |  |  +-ssh server-----+  |
|| +-WSL2(Ubuntu)--+   |  |  |                |  |
|| |  - sshfs------------------>- sftp        |  |
|->|  - ssh client |   |  |  |                |  |
|  |               |   |  |  |                |  |
|  +---------------+   |  |  +----------------+  |
+----------------------+  +----------------------+
```

## 導入手順

導入における環境は以下の通り。

パラメータ                                   | 値
-------------------------------------------- | -----------
Linux側のマウントされるディレクトリ名        | /dirname
WSL2上のマウントするディレクトリ名           | dirmount
WSL2上の~/.ssh/configに登録するLinuxのhost名 | ubuntu

### Linux

1. ssh serverをインストールする
2. 「/etc/ssh/sshd_config」を以下のように設定し、sftpでアクセス可能にする
  ```text
  ...abbr...
  # 元から存在する設定をコメントアウトし、追加
  # Subsystem sftp	/usr/lib/openssh/sftp-server
  Subsystem sftp	internal-sftp
  ...abbr...
  ```

### Windows

WindowsにWSL2をインストールする

### WSL2(Ubuntu)

1. sshでLinuxにアクセスするための秘密鍵、公開鍵を生成し、Linuxに公開鍵を登録する
2. 「~/.ssh/config」にLinuxへのアクセス情報を登録する
3. WSL2にsshfsをインストールする
4. Windowsからsshfsでマウントしたディレクトリへアクセスするために設定する
  ```diff
  - #user_allow_other
  + user_allow_other
  ```
5. 「dirmount」ディレクトリを作成する。
6. 任意のディレクトリをWSL2にマウントする。
  ```sh
  sshfs ubuntu:/dirname dirmount/ -o allow_other
  ```

### Winodws

File Explorerのアドレスバーに「\\wsl$」を入力し、dirmountにアクセスする。

## 参考

<https://wiki.archlinux.jp/index.php/SSHFS>
