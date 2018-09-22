//
//  NumberdTask.swift
//  Todo
//
//  Created by futa on 2018/09/21.
//  Copyright © 2018年 中山楓太. All rights reserved.
//

import Foundation
import RealmSwift
final class NumberedTask : Object { //NumberedTaskクラスにprimaryKeyを実装した
    @objc dynamic var title = ""
    @objc dynamic var content = ""
    @objc dynamic var id = 0
    override static func primaryKey() -> String? {
        return "id"
    }
}

class operateTask {
    
    var utils = RealmUtils()
    var tasks: Results<NumberedTask>!
    
    
    
    init() { //initでResultを取得すればあとは自動更新
        tasks = utils.getResults()
    }
    
    /*  Todoリストを全部print。Viewの仕事かと思ったので削除
    func printAllTask(){
        print(tasks)
    }
    */
    
    func getTask(_ number: Int) -> NumberedTask{    //Realmに登録されているTodoリストの中から指定したidのTaskを取得
        return tasks[number]
    }
    
    func writeToRealm(_ title: String, _ content: String, _ id: Int) {  //RealmSwiftにRealmへの書き込みを依頼
        let task = NumberedTask()
        
        task.title = title
        task.content = content
        task.id = id
        
        if task.title != ""{
            utils.writeToRealm(task)
        } else {
            print("taskのtitleが入力されていません")
        }
    }
    
    func deleteFromRealm(task: NumberedTask) {
        utils.delete(obj: task)
    }

    func getAllTask() -> Results<NumberedTask> {    //Realmに登録されているTodoリストを一括取得
        return tasks
    }
 
}

