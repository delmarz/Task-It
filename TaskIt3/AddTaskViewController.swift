//
//  AddTaskViewController.swift
//  TaskIt3
//
//  Created by delmarz on 1/20/15.
//  Copyright (c) 2015 delmarz. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {

    var mainVC: ViewController!
    
    @IBOutlet weak var taskField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func cancelButtonPressed(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addButtonPressed(sender: UIButton) {
       
        let delegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context = delegate.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: context!)
        let tasks = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: context!)
        
        // or
        
        /*
        let task = NSEntityDescription.insertNewObjectForEntityForName("TaskModel", inManagedObjectContext: context!) as TaskModel
        */
        
        tasks.task = self.taskField.text
        tasks.subtask = self.subtaskTextField.text
        tasks.date = self.dueDatePicker.date
        tasks.completed = false
        
        delegate.saveContext()
        
        var error:NSError? = nil
        var fetchRequest = NSFetchRequest(entityName: "TaskModel")
        var results:NSArray = context!.executeFetchRequest(fetchRequest, error: &error)!
        
        for res in results{
            println(res)
        }
        
        
         self.dismissViewControllerAnimated(true, completion: nil)
    }


}
