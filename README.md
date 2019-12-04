https://app-cook-memo.herokuapp.com/

# レシピ管理アプリ
![image](https://user-images.githubusercontent.com/55653128/70110338-f386fb00-1691-11ea-9c8d-b8bd114d4101.png)
![image](https://user-images.githubusercontent.com/55653128/70107530-1c0af700-168a-11ea-9b38-07494209f14f.png)

## 制作理由
夕飯がいつも決められない優柔不断さから生まれたアプリケーションです。
- 自分で考えたレシピを保管する
- どこかのサイトのお気に入りのレシピのurlを保管する
- ランダム機能を使うためだけに料理名だけを登録する

自分好みに作成して管理できればと思い、このアプリケーションを作成しました。

## できること
### レシピの管理
- レシピを記入し管理することができます

編集ページ
![image](https://user-images.githubusercontent.com/55653128/70107568-3644d500-168a-11ea-89c3-9a7d425082a1.png)


閲覧ページ
![image](https://user-images.githubusercontent.com/55653128/70107696-9a679900-168a-11ea-9abd-547f0e549582.png)


- urlだけでも管理することができるので、インターネットで見つけたレシピを管理することもできます。
![image](https://user-images.githubusercontent.com/55653128/70107671-83c14200-168a-11ea-845a-1305563390b7.png)


### レシピ検索
- ヘッダー右にある検索機能で登録したレシピをあいまい検索できます。

### カテゴリーからの検索
- 固定カテゴリーと自由につけられるカテゴリーがあり、カテゴリー別に検索が可能です。
- カテゴリーを複数選択して検索することも可能です。
- 自由につけたカテゴリーは他のユーザーに影響することはありません。(表示されません)
- ヘッダーのカテゴリーをクリックするとカテゴリーのドロップダウンリストが表示され、一番下にカテゴリー一覧ページとカテゴリー絞り込みページにアクセスするリンクがあります。
![image](https://user-images.githubusercontent.com/55653128/70113181-8c6e4400-169b-11ea-9527-e2a572882fe9.png)

### ランダム選択
- 献立に迷ったときにランダムでレシピを選んでくれる機能です。
- 今の気分のカテゴリーを選択して検索したレシピの中から１つだけレシピが表示します。
- レシピの登録数が少ないとあまり機能しないため、レシピの作成では名前だけの登録も可能にしています。
- ヘッダーの「何作る？」をクリックするとご覧いただけます。

![image](https://user-images.githubusercontent.com/55653128/70107815-f16d6e00-168a-11ea-995d-2a5c667a1f63.png)


### 今後の実装
- レシピ作成後カテゴリーの変更・削除が行えないため、編集できるようにする
- 材料入力で一度にたくさんの登録ができる
- お気に入り機能をつける
