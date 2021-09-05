# 無料で利用可能なクラウドサービスを探す

## Microsoft Azure
Azure Functions, Azure App Service辺りが使いやすい。

## Amazon Web Services (AWS)
VMの無料分はない。

## Google Cloud Platform (GCP)

ちょこちょこ色々ある。

## Oracle Cloud Infrastructure (OCI)

どのサービスも使いやすそう。
VM, DB, VPN, Load Balancing, Storageなど色々ある。

* VM

Name                   | OCPU | Memory(GB) | Local Disk         | Max Network Band | Max VNIC | 対応OS                                                   | 備考
-----------------------|------|------------|--------------------|------------------|----------|----------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------
VM.Standard.E2.1.Micro | 1    | 1          | Only Block Storage | 1                | 480Mbps  | 1                                                        | Oracle Linux Cloud Developer 8<br>Oracle Linux<br>Oracle Autonomous Linux<br>Ubuntu<br>Cent OS | CPU: AMD EPYC 7551<br>2台分
VM.Standard.A1.Flex    | 4    | 24         | -                  | -                | -        | Oracle Linux Cloud Developer 8<br>Oracle Linux<br>Ubuntu | CPU: Arm<br>3,000CPU時間/月, 18,000GB/月

* ブロック・ボリューム
  - 合計200GB 5つ
    - ブート・ボリューム (最低50GB)
    - Always Freeブロック・ボリューム・ストレージ

* オブジェクト・ストレージおよびアーカイブ・ストレージ
  - 合計20GBデータ
    - 10 GBの標準階層データ
    - 10 GBのアクセス頻度の低い階層データ
    - 10 GBのアーカイブ層データ 
  - 50,000 APIリクエスト/月

* リソース・マネージャ
  - 詳細は省略

* データベース
  - Autonomous Database 2つ
    - 1OCPU, 20GBストレージ, 20同時セッション
  - Oracle NoSQL Database
    - 読み取り 133百万/月
    - 書き込み 133百万/月
    - 共有Exadataインフラストラクチャ
    - 25GB Storage per 3 Table

* ロード・バランシング
  - シェイプ:柔軟(最小および最大: 10 Mbps)
  - リスナー: 16
  - 仮想ホスト名: 16
  - バックエンド・セット: 16
  - バックエンド・サーバー: 1024

* ネットワーク・ロード・バランサ
  - 1つ
    - リスナー: 50
    - バックエンド・セット: 50
    - セット当たりのバックエンド・サーバー数: 512
    - バックエンド・サーバー合計: 1024 (バックエンド・セット間で分散されます)

* 仮想クラウド・ネットワーク (VCN)
  - 最大2つ

* Site-to-Site VPN
  - 最大50のIPSec接続

* Monitoring
  - 500万モニタリング・サービス収集データ・ポイント
  - 10億の取得データ・ポイント

* Application Performance Monitoring
  - 1000トレース・イベント/時

* 通知
  - https通知: 100万件/月
  - 電子メール: 1000件/月

* サービス・コネクタ・ハブ
  - Always Free サービス・コネクタ 2つ

* ブロック・ボリューム・ストレージ
  - 200GB

* アウトバウンド・データ転送
  - 10TB

* セキュリティ・ゾーン
* LOOGGING
* Bastion

---
## 参照
* Azure
<https://azure.microsoft.com/ja-jp/free/free-account-faq/>
* AWS
<https://aws.amazon.com/jp/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all>
* GCP
<https://cloud.google.com/free/docs/gcp-free-tier?hl=ja>
* OCI
<https://docs.oracle.com/ja-jp/iaas/Content/FreeTier/freetier_topic-Always_Free_Resources.htm#>
