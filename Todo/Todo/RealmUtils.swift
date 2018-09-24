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
    static var realm = try! Realm()

    static func writeToRealm(_ obj: Object) {//Write(Update)
        try! realm.write {
            realm.add(obj, update: true)    //updateも新規作成もできる
            print("success", obj)
        }
    }

    //make Realm内の指定したデータのみ削除
    static func delete(obj: Object) {  //Delete a data
        try! realm.write {
            realm.delete(obj)
        }
    }
    
    static func deleteRealm(){ //DeleteAll
        try! realm.write {
            realm.deleteAll()
            print("success deleteAll")
        }
    }
 
    static func getResults<T: Object>(obj: T) -> Results<T> {
        return realm.objects(type(of: obj))
    }

}
