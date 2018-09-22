//
//  TodoListViewController.swift
//  Todo
//
//  Created by futa on 2018/09/03.
//  Copyright © 2018年 中山楓太. All rights reserved.
//

import UIKit
import RealmSwift


class TodoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var addButton: UIButton!
    var utils = RealmUtils()
    var opTask = operateTask()
    var todos = ["料理","洗濯","掃除"]
//    lazy var realm = try! Realm()
    var tasks : Results<NumberedTask>!
    var rowNumber :Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TodoList")
        tasks = utils.getResults()  //Todoリストを取得
        // Do any additional setup after loading the view.
        opTask.printTodoAll()
    }
    
    //Todoのデータを全取得
/*    func getRealmData(){
        do {
            let realm = try Realm()
            let results = realm.objects(NumberedTask.self)
            print("Realm全データ", results.count)
            print(results)
        } catch {}
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        let Task = utils.getRealmData(indexPath.row, tasks)
        cell.textLabel!.text = Task.title

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //選択したcellの行数
        rowNumber = indexPath.row
        print("rowNumber = ", rowNumber)
        performSegue(withIdentifier: "toTodoDetailViewController", sender: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    /*func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }*/
    

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == "toTodoDetailViewController" { //tapped cell
            let next : TodoDetailViewController = (segue.destination as? TodoDetailViewController)!
            let Task = utils.getRealmData(rowNumber, tasks)
            next.titleText = Task.title
            next.contentText = Task.content
            next.cellRowNumber = rowNumber
        } else if identifier == "addTask" { //pushed add button
            let next : TodoDetailViewController = (segue.destination as? TodoDetailViewController)!
            next.cellRowNumber = tasks.count
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
