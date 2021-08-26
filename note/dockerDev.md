# Dockerを利用した開発環境

## 利用ツール
* vim
* docker(docker compose)

## 概要
* dockerコンテナ上のvimでコーディング

## docker概要
* docker-composeの基本を抑える
https://www.fenet.jp/dotnet/column/tool/3173/

Docker Hubの無料プランにおいて、利用可能なCI/CDはWebhooksのみで、GitHubとの連携などはできない。[^1]
Docker HubのAutomated Buildが有料なので、違う方法でDocker HubとGitHubを連携する。

## GitHubでのdockerビルド方法
### ビルドOS作成
* 自分でビルドサーバを構築する場合
<https://docs.github.com/ja/actions/hosting-your-own-runners/adding-self-hosted-runners>
* GitHub上で用意されているビルドサーバを利用する場合
<https://knowledge.sakura.ad.jp/23478/>
<https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners>
  - サポートされているOS <https://github.com/marketplace/actions/run-on-architecture#supported-platforms>
  - GitHub Actionsの拡張はGitHub Marketplaceで行う
  <https://docs.github.com/ja/github/customizing-your-github-workflow/exploring-integrations/about-github-marketplace>

## 参考ページ
<https://qiita.com/peaceiris/items/eed834bb3693f941c892>

---
[^1]: <https://www.docker.com/pricing>

