//
//  DetailTaskViewController.swift
//  TaskIt3
//
//  Created by delmarz on 1/20/15.
//  Copyright (c) 2015 delmarz. All rights reserved.
//

import UIKit

class DetailTaskViewController: UIViewController {

    var mainVC: ViewController!
    var detailTaskModel: TaskModel!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.taskTextField.text = detailTaskModel.task
        self.subtaskTextField.text = detailTaskModel.subtask
        self.dueDatePicker.date = detailTaskModel.date
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelBarButtonItemPressed(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func doneBarButtonItemPressed(sender: UIBarButtonItem) {
        
//        let thisTask = TaskModel(task: self.taskTextField.text, subtask: self.subtaskTextField.text, date: self.dueDatePicker.date)
//    
//        
//        if self.mainVC.tableView.indexPathForSelectedRow()?.section == 0 {
//              self.mainVC.baseArray[0][mainVC.tableView.indexPathForSelectedRow()!.row] = thisTask
//        }
//        else {
//              self.mainVC.baseArray[1][mainVC.tableView.indexPathForSelectedRow()!.row] = thisTask
//        }
//        
//   
//         self.navigationController?.popViewControllerAnimated(true)
        
        
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        
        self.detailTaskModel.task = self.taskTextField.text
        self.detailTaskModel.subtask = self.subtaskTextField.text
        self.detailTaskModel.date = self.dueDatePicker.date
        self.detailTaskModel.completed = false
        
        appDelegate.saveContext()
        
        self.navigationController?.popViewControllerAnimated(true)
        
        
        
        
   }
        
        


}
