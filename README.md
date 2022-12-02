[![cloth_size_main_logo](https://user-images.githubusercontent.com/95204839/205243618-c2cd521a-6e82-4e11-bd0f-900abef990f1.png)](https://www.cloth-to-size.com/)

# サービス概要
洋服のサイズをジャンルごとに記録できるサービスです。  

# メインのターゲットユーザー
ネットショッピングで洋服をたまに購入する方。

# ユーザーが抱える課題
__ネットショッピングをするとき、こんなお悩みはありませんか？__  

「海外のサイトを使用すると、S・M・Lなど指定されているとき、いつものサイズを選んでも大きすぎたり、小さすぎたりしてサイズ選びで失敗してしまう」  
「たまにしかネットショッピングをしないため、その度にサイズを測るのは面倒臭いと感じてしまう」  

そんな方達のために、クロササイズがネットショッピングをストレスなく快適に利用するための手助けをします！

# 解決方法
トップス・ボトムス・ワンピース・アウター・帽子・指輪・下着の7種類のジャンルごとに,それぞれの部位のサイズを記録することができます。  
また、今後LINE連携を導入する予定です。LINE連携により、記録したサイズをLINEで簡単に取得することができるようになります。  

# 機能一覧
|  トップページ（ログイン前） |  トップページ（ログイン後）  |
| ---- | ---- |
|  <p align="center"><img src="https://user-images.githubusercontent.com/95204839/205238461-cd5bde04-11d6-4867-b547-a408250f8fa5.png" width="140"></p>  |  <p align="center"><img src="https://user-images.githubusercontent.com/95204839/205239233-62da26ec-f0ff-4295-9bca-f80c7773a56a.png" width="150"></p>  |
|  メールでログインする。<br>また、ゲストログインで簡単にお試しもできる。|  ログイン後はトップページに洋服のジャンルボタンが表示される  |  

|  ユーザー新規登録ページ  | 　ログインページ  |
| ---- | ---- |
| <p align="center"><img src="https://user-images.githubusercontent.com/95204839/205240808-fb7b9b63-76e6-459f-aeed-f17099f2a4d6.png" width="150"></p> | <p align="center"><img src="https://user-images.githubusercontent.com/95204839/205240664-0d610cf8-cb1f-436c-bdd3-66960a70d9a7.png" width="150"></p> |
|  測ったサイズを記録する<br>それぞれの部位名はガイド画像を参照&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  |  記録したサイズを表示<br>編集ボタンを押すことでサイズ編集画面へ遷移&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  |  


|  サイズ新規記録ページ  |  サイズ詳細ページ  |
| ---- | ---- |
| <p align="center"><img src="https://user-images.githubusercontent.com/95204839/205239863-67c77cf8-c555-4e5a-b64b-042c206b7aa2.png" width="150"></p> | <p align="center"><img src="https://user-images.githubusercontent.com/95204839/205240090-32e75c39-442b-4f56-bef3-08139c114019.png" width="150"></p> |
|  測ったサイズを記録する<br>それぞれの部位名はガイド画像を参照&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  |  記録したサイズを表示<br>編集ボタンを押すことでサイズ編集画面へ遷移&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  |  

| サイズ編集ページ |    |
| ---- | ---- |
| <p align="center"><img src="https://user-images.githubusercontent.com/95204839/205240247-500caaac-afe5-4135-93ff-7a750b5be839.png" width="150"></p> | ---- |
|  記録したサイズを変更する&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  |    |  

# このサービスを作成しようと思った背景
以前、ネットショッピングで洋服を買った友人に失敗した言われたことがありました。  
私もよくネットショッピングで洋服を買いますが、サイズを測ったりレビューを確認したりなど自分なりに失敗しない方法を把握して実践していたので、失敗することはほとんどありませんでした。  
そこで、友人にサイズを測れば失敗しないことを伝えましたが、ネットショッピングをするたびにいちいちサイズを測るのは面倒臭いと言われてしまいました。  
この出来事から、もし測ったサイズを一度記入したら必要な時に簡単に確認できるサービスを作成したら友人の手助けになるのではと思い、このサービスを作成しようと思いました。  

# 使用技術
### バックエンド
* Ruby 3.1.2
* Rails 7.0.4
* Node.js 18.11.0
<details>
<summary>主なgem</summary>

* [sorcery](https://github.com/Sorcery/sorcery)<br>
* [line-bot-api](https://github.com/line/line-bot-sdk-ruby)<br>
* [meta-tags](https://github.com/kpumuk/meta-tags)<br>
* [RSpec](https://github.com/rspec/rspec-rails)
</details>

### インフラ
* heroku




# スケジュール
企画〜技術調査：7/31〆切  
README〜ER図作成： 7/31〆切  
メイン機能実装：8/1 - 9/11
β版をRUNTEQ内リリース（MVP）：9/12〆切  
本番リリース：10/30

[画面遷移図](https://www.figma.com/file/k6cFM3JBXOUhb6XWVpuqEs/Untitled?node-id=0%3A1)

[ER図](https://app.diagrams.net/#Hsuzuki-yuka-27%2Fnet_shopping_size%2F01_edit_README.md%2Fnet_shopping.drawio)
