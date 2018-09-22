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
    let opTask = operateTask()
    var cellRowNumber : Int = 0
    
//    var tasks : Results<NumberedTask>!
    var titleText : String? //TodoListViewControllerから受け取る用
    var contentText : String?   //TodoListViewControllerから受け取る用
    
    @IBOutlet weak var titleView: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func writeRealm() {
        opTask.writeToRealm(self.titleView.text!, self.textView.text!, cellRowNumber)
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
