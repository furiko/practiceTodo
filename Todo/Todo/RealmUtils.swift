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

    static func writeToRealm(_ obj: NumberedTask) {//Write(Update)
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
    
    static func getResults() -> Results<NumberedTask> {//Get
        //Realmに登録されたNumberedTask型のデータを全取得
        //NumberedTask以外の型も返せるような一般的な書き方が分からない
        return realm.objects(NumberedTask.self)
    }
    
    /*
    //一般的に書こうとするとエラーになってしまう

    static func getResults(obj: Object) -> Results<Object> {//GetAll
        //Realmに登録されたNumberedTask型のデータを全取得
        //NumberedTask以外の型も返せるような一般的な書き方が分からない
        return realm.objects(obj.self)
        //Cannot convert value of type 'Object' to expected argument type 'Object.Type'
    }
    
    static func getResults<T>(obj: T) -> Results<T> {
        return realm.objects(obj.self)
    }
    */
    
    //Insertion    実装方法が分からない
}
