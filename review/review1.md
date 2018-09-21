## レビュー1

#### 全体的に
- コード自体はよくかけていると思います．
- 所謂アーキテクチャ的な部分を考慮できるとなお良かったかな〜
ということでこの辺の話を主にしていきます

#### ファイルの分け方について
iOSに限らず，ファイルは最低限ViewControllerとModel部分に分けたほうがいいです   
例えば今回でいうとTodoDetailViewControllerとnumberedTaskは別のファイルにあるべき   
また，Realmなんかも今回はTodoにしか使わなかったけれど，例えばユーザー登録を実装するってなって，
それにもRealmを使いたいとなった時に今回の実装だったらO(n)個のRealm関数ができてしまうよね．   
つまり何が言いたいかというとRealmUtils.swift的なの作って，どんなオブジェクトでもGetAll, Get, Insert, Update, Deleteとかその辺ができるような
関数を組むのがいいと思うってことです．   
話をまとめると，ファイル構成は以下のようになって欲しいなと   
- ViewController
	- TodoListViewController.swift
	- TodoDetailViewController.swift
	- Main.storyboard
- Model
	- NumberedTask.swift
- Utils
  - ReslmUtils.swift

#### TodoListViewController.swift
---
`TodoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource`は拡張文を使って   
```swift
class TodoListViewController: UIViewController {
...
}

extension TodoListViewController: UITableViewDelegate {

}

extension TodoListViewController: UITableViewDataSource {

}
```   
って書いて，適した部分にDelegateなりDataSourceなりのメソッドを書き込むとすごく見やすくなります．   

---

`override func didReceiveMemoryWarning()`は基本的にいらないから消してもらっても問題ないです．   

---

```
if rowNumber != nil {
  print("rowNumber = ", rowNumber!)
  performSegue(withIdentifier: "toTodoDetailViewController", sender: nil)
}
```   
この`rowNumber != nil `っているかな？Cellが選択さされた時に呼ばれるメソッドで呼ばれたCellのindexがnilってのは理論的にありえない気がするw   
だから`var rowNumber: Int?`を`var rowNumber: Int`にしても問題ないと思う   

#### TodoDetailViewController
---

現状title, contentのどちらもが空白でもTodoが登録できるようになっていることから，何も書いていないCellができてしまいますね．   
少なくともtitleだけは書いていないと登録できないようにしてしまった方がいいと思います．   
編集の時も同様ですね．