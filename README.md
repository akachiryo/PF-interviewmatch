# [MennRenn](https://mennrenn.com/) 気軽に練習相手探せるアプリ
![MennRenn](https://user-images.githubusercontent.com/85982768/136354125-26e12710-2c20-4147-a08f-d88027a6e85a.gif)
サイトURLは[こちら](https://mennrenn.com/)

面接練習がしたいとき、**気軽に練習相手をマッチング**して見つけることができるアプリです。
面接練習の条件（時間、業種等）を指定した部屋を作成し、マッチングする相手を探します。こちらから、条件に合う部屋を探すこともできます。


### テーマを選んだ理由
　終身雇用が当たり前だった時代から、自分のスキルに見合った企業への転職が増加しており、日本の働き方が変化しています。転職活動するうえで、合否を大きく分けるのが面接です。「スキルはあるのに面接で失敗してしまった」という人も多いはずです。ただし、面接練習をしようと考えるも１人で練習することが難しいです。この難点を、「MennRenn」を使うことで**練習相手を見つけ、面接力を高めよう**というアプリです。このアプリを活用することで、就活・転職している方のサポートができればよいと考えております。
 
### ターゲットユーザ
就活生、転職者

## 機能
- ユーザー登録、ログイン(devise)
  - ユーザー
  - 管理者
- 画像投稿機能(ActiveStorage)
- ルーム機能
- スケジュール管理機能(simple_calenda)
- フォロー機能
- DM機能
- お問い合わせ機能
- 通知機能
- タグ機能
- ページネーション機能(kaminari)

## 技術
### インフラ
- Linux(CentOS)
- Ruby 2.6.3
- Ruby on Rails 5.2.5
- MySQL 5.7
- Nginx
- Puma
- AWS
  - EC2
  - VPC
  - RDS
  - Route53
- GitActions（CI/CD）

### 開発
- レスポンシブデザイン（Flexbox,Boostrap）
- 環境変数化（bash_profile）
- テスト（RSpec）
- N+1問題(bullet)
- 可読性の高いコード(Rubocop)
- デバッグ(pry-byebug)

機能・技術詳細は[こちら](https://docs.google.com/spreadsheets/d/142KtB-SIKeLuhXgVI_3fRV6PX93IBfW87-pm1sbHodM/edit?usp=sharing)

## 設計書
![ER図](https://user-images.githubusercontent.com/85982768/136347420-79a556ab-3542-432d-aa05-789b2e6c2654.png)
- [ER図](https://drive.google.com/file/d/1nWENUMw2PwqOee9tHfykloUeg7Y1wXMW/view?usp=sharing)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1N5JukksgXzsvlRtoKJJcxqni-p9SH7Ef/edit?usp=sharing&ouid=111121812190906123216&rtpof=true&sd=true)
- [詳細設計](https://docs.google.com/spreadsheets/d/1N5JukksgXzsvlRtoKJJcxqni-p9SH7Ef/edit?usp=sharing&ouid=111121812190906123216&rtpof=true&sd=true)

## インフラ構造図
![インフラ構造図](https://user-images.githubusercontent.com/85982768/136348088-da65eea3-aad1-4cd4-826a-b76fe69d5eee.png)
- [インフラ構造図](https://drive.google.com/file/d/1PJ7jegyAWn8Pz5R1UjNcNBBmPciJ0ihJ/view?usp=sharing)
