//
//  TodoDetailViewController.swift
//  Todo
//
//  Created by futa on 2018/08/25.
//  Copyright © 2018年 中山楓太. All rights reserved.
//

//reviewを受けて修正開始 2018/09/21
import UIKit
import RealmSwift

/*final class TaskList : Object{    //sampleコピペ。使わなかった
    @objc dynamic var text = ""
    @objc dynamic var id = ""
    let items = List<Task>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}*/

/*final class Task : Object {   //updateにprimaryKeyが無いのが不便で、クラス書き換えると落ちたので使わない
    //    @objc dynamic var tittle = ""
    @objc dynamic var title = ""
    @objc dynamic var content = ""
} */

final class numberedTask : Object { //TaskクラスにprimaryKeyを実装した
    @objc dynamic var title = ""
    @objc dynamic var content = ""
    @objc dynamic var id = 0
    override static func primaryKey() -> String? {
     return "id"
    }
}

class TodoDetailViewController: UIViewController {
    
    var cellRowNumber : Int!
    lazy var realm = try! Realm()
    var tasks : Results<numberedTask>!
    var titleText : String? //TodoListViewControllerから受け取る用
    var contentText : String?   //TodoListViewControllerから受け取る用
    
    @IBOutlet weak var titleView: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func writeRealm() {
        do {
            let realm = try Realm()
            let task = numberedTask()
            
            task.title = self.titleView!.text!
            task.content = self.textView!.text!
            task.id = cellRowNumber!
            
            try! realm.write {
                realm.add(task, update: true)
                print("success", task)
            }
            
        } catch {
            print("Errorです")
            /*var config = Realm.Configuration()
            config.deleteRealmIfMigrationNeeded = true
            let realm = try! Realm(configuration: config)*/
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1.0
        
        //initialize title and content if they are sent by TodoListViewController
        if titleText != nil {
            titleView.text = titleText
        }
        if contentText != nil {
            textView.text = contentText
        }
        /*do {  //reset all Todo task
            let realm = try Realm()
            try! realm.write {
                realm.deleteAll()
                print("success deleteAll")
            }
        }catch {
            print("failed to deleteAll")
        }*/

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
