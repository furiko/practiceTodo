//
//  RealmUtils.swift
//  Todo
//
//  Created by futa on 2018/09/21.
//  Copyright © 2018年 中山楓太. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUtils {
    lazy var realm = try! Realm()
    var tasks : Results<NumberedTask>!
    
/*    func getRealmAllData(){
        
//            let realm = try Realm()
        let results = realm.objects(NumberedTask.self)
        print("Realm全データ", results.count)
        print(results)
        
    }*/
    
    func getRealmData(_ number: Int, _ tasks: Results<NumberedTask> ) -> NumberedTask {
        return tasks[number]
    }
    
    func writeToRealm(_ obj: NumberedTask) {
//        do {
            //            let realm = try Realm()
            /*let task = NumberedTask()
            
            task.title = title
            task.content = content
            task.id = id*/
            
            try! realm.write {
                realm.add(obj, update: true)
                print("success", obj)
            }
            
        /*} catch {
            print("Errorです")
            /*var config = Realm.Configuration()
             config.deleteRealmIfMigrationNeeded = true
             let realm = try! Realm(configuration: config)*/
        }*/
    }
    
    func deleteRealm(){
//        do {  //reset all Todo task
//            let realm = try Realm()
            try! realm.write {
                realm.deleteAll()
                print("success deleteAll")
            }
        /*}catch {
            print("failed to deleteAll")
        }*/
    }
    
    func getResults() -> Results<NumberedTask> {
        return realm.objects(NumberedTask.self)
    }
}
