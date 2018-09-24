##進捗2

####色々なRealmオブジェクトに対応
ジェネリクスを利用して対応.

####Realm操作関連の関数をstatic化
全てstaticに.

####空白の開け方,セミコロンの位置
気づいた範囲でセミコロンの打ち方,空白の開け方を修正しました.

####NumberedTaskの操作を別クラスでやっていたので統合
NumberedTaskをoperateTaskという別のクラスを作って操作していたのをNumberedTaskに集約しました.

####Insert
InsertはDBに新規追加という意味だということを理解していなかった.DBへの新規追加,UpdateはどちらもwriteToRealm関数で対応.

####Buttonを押した時のメソッド
tapOKButtonへ名称を変更

####titleが空白の場合の挙動
titleが空白の際には同じViewに止まったままアラートが表示されるように変更.