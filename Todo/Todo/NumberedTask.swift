//
//  NumberdTask.swift
//  Todo
//
//  Created by futa on 2018/09/21.
//  Copyright © 2018年 中山楓太. All rights reserved.
//

import Foundation
import RealmSwift
final class NumberedTask: Object { //NumberedTaskクラスにprimaryKeyを実装した
    @objc dynamic var title = ""
    @objc dynamic var content = ""
    @objc dynamic var id = 0
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //以降NumberedTask操作用のメソッド達
    var tasks: Results<NumberedTask>!
    func getTask(_ number: Int) -> NumberedTask {    //Realmに登録されているTodoリストの中から指定したidのTaskを取得

        return tasks[number]
    }
    
    func writeToRealm(_ title: String, _ content: String, _ id: Int) {  //RealmSwiftにRealmへの書き込みを依頼
        let task = NumberedTask()
        
        task.title = title
        task.content = content
        task.id = id
        
        print("書き込み")
        RealmUtils.writeToRealm(task)
    }
    
    func deleteFromRealm(task: NumberedTask) {
        RealmUtils.delete(obj: task)
    }
    
    func getAllTask() -> Results<NumberedTask> {    //Realmに登録されているTodoリストを一括取得
        if tasks == nil {   //初回のみtasksがnilなのでrealmから取得
            //operateTaskクラスでNumberedTaskのインスタンスを操作していた時はtasksはinitで取得していたが、realmのクラス内でinitはoverrideできないようなので代わりの措置
            let Task = NumberedTask()
            tasks = RealmUtils.getResults(obj:Task)
        }
        return tasks
    }
    
}
