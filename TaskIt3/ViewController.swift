//
//  ViewController.swift
//  TaskIt3
//
//  Created by delmarz on 1/18/15.
//  Copyright (c) 2015 delmarz. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var baseArray:[[TaskModel]] = []
    
    var managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
    var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.fetchedResultsController = getFetchedResultsController()
        self.fetchedResultsController.delegate = self
        self.fetchedResultsController.performFetch(nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
//        self.baseArray[0] = self.baseArray[0].sorted {
//            
//            (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
//            
//            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
//        }
//        
//        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addBarButtonItemPressed(sender: UIBarButtonItem) {
    
        self.performSegueWithIdentifier("showAddTask", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetailTask" {
            
            let detailTaskVC: DetailTaskViewController = segue.destinationViewController as DetailTaskViewController
            let indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()!
            let thisTask = self.fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
            detailTaskVC.detailTaskModel = thisTask
            detailTaskVC.mainVC = self
        }
        
        if segue.identifier == "showAddTask" {
            
            let addTaskVC: AddTaskViewController = segue.destinationViewController as AddTaskViewController
            addTaskVC.mainVC = self
        }
        
    }
    
    // MARK:
    // MARK: UITableView DataSource
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return self.fetchedResultsController.sections!.count
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchedResultsController.sections![section].numberOfObjects
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: TaskCellTableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCellTableViewCell
        
        
        let thisTask = self.fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
      
        
        cell.taskLabel.text = thisTask.task
        cell.subtaskLabel.text = thisTask.subtask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        
        
        
        return cell
    }
    // MARK:
    // MARK: UITableView Delegate
    
    // UITableView Delegate
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("showDetailTask", sender: self)
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        if section == 0 {
            return "To do"
        }
        else {
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let thisTask = self.fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
        
        if indexPath.section == 0 {
            
            thisTask.completed = true
        }
        else {
     
            thisTask.completed = false
        }
        
        (UIApplication.sharedApplication().delegate as AppDelegate).saveContext()
        self.tableView.reloadData()
        
    
    }
    
    
    // NSFecthedResultsControler Delegate
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        self.tableView.reloadData()
    }
    
    
    // Helpers 
    
    
    func taskFetchRequest() ->NSFetchRequest {
        
        let fetchRequest = NSFetchRequest(entityName: "TaskModel")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        let completedDescriptor = NSSortDescriptor(key: "completed", ascending: true)
        fetchRequest.sortDescriptors = [completedDescriptor, sortDescriptor]
        
        return fetchRequest
        
    }
    
    func getFetchedResultsController() ->NSFetchedResultsController {
        
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: self.managedObjectContext, sectionNameKeyPath: "completed", cacheName: nil)
        
        return self.fetchedResultsController
        
    }
    
    
}

