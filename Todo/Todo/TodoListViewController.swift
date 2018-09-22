//
//  TodoListViewController.swift
//  Todo
//
//  Created by futa on 2018/09/03.
//  Copyright © 2018年 中山楓太. All rights reserved.
//

import UIKit
import RealmSwift


class TodoListViewController: UIViewController {
    @IBOutlet weak var addButton: UIButton!
    var opTask = operateTask()
    var tasks : Results<NumberedTask>!
    var rowNumber :Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TodoList")
        tasks = opTask.getAllTask()
        // Do any additional setup after loading the view.
        print(tasks)    //Todoリストの全表示
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //pass property to TodoDetailViewController
        let identifier = segue.identifier
        if identifier == "toTodoDetailViewController" { //tapped cell
            let next : TodoDetailViewController = (segue.destination as? TodoDetailViewController)!
            let Task = opTask.getTask(rowNumber)
            next.titleText = Task.title
            next.contentText = Task.content
            next.cellRowNumber = rowNumber
        } else if identifier == "addTask" { //pushed add button
            let next : TodoDetailViewController = (segue.destination as? TodoDetailViewController)!
            next.cellRowNumber = tasks.count
        }
    }
}

extension TodoListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //prepare
        rowNumber = indexPath.row //選択したcellの行数
        print("rowNumber = ", rowNumber)
        performSegue(withIdentifier: "toTodoDetailViewController", sender: nil)
    }
}

extension TodoListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        let Task = opTask.getTask(indexPath.row)
        cell.textLabel!.text = Task.title
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
}


    /*func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }*/

