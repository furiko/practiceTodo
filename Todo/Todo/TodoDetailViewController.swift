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

class TodoDetailViewController: UIViewController {
    let opTask = NumberedTask()
    var cellRowNumber = 0
    
//    var tasks : Results<NumberedTask>!
    var titleText: String? //TodoListViewControllerから受け取る用
    var contentText: String?   //TodoListViewControllerから受け取る用
    
    @IBOutlet weak var titleView: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func tapOKButton() {
        let title = self.titleView.text!
        if title != ""{
            opTask.writeToRealm(title, self.textView.text!, cellRowNumber)
            let storyboard: UIStoryboard = self.storyboard!
            let nextVC = storyboard.instantiateViewController(withIdentifier: "TodoList")
            present(nextVC, animated: true, completion: nil)
        } else {    //title空欄の時はアラートを表示
            print("title blank")
            let alert: UIAlertController = UIAlertController(title: "タイトルを入力してください", message: "タイトルが入力されていません", preferredStyle: .alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in
                print("OK")})
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1.0
        
        initTitleAndContent()
    }
    
    func initTitleAndContent() {
        //initialize title and content if they are sent by TodoListViewController
        if titleText != nil {
            titleView.text = titleText
        }
        if contentText != nil {
            textView.text = contentText
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
