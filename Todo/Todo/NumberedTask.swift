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

/*    func writeTodo(_ title: String, _ content: String, _ id: Int){
        let task = NumberedTask()
        
        task.title = title
        task.content = content
        task.id = id
        
        
    }*/
}

class operateTask {
    var tasks: Results<NumberedTask>!
    var utils = RealmUtils()
    func writeTodo(_ title: String, _ content: String, _ id: Int){
         let task = NumberedTask()
        
         task.title = title
         task.content = content
         task.id = id
    }
    
    func printTodoAll(){
        let tasks = utils.getResults()
        print(tasks)
    }
    
    func getTodo(_ number: Int) -> NumberedTask{
        return tasks[number]
    }
    
    func writeToRealm(_ title: String, _ content: String, _ id: Int) {
        let task = NumberedTask()
        
        task.title = title
        task.content = content
        task.id = id
        
        utils.writeToRealm(task)
    }
    /*func getResults(){
        
    }*/
}

