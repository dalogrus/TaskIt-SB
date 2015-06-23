//
//  AddTaskViewController.swift
//  TaskIt-SB
//
//  Created by Sebastian Burek on 29.04.2015.
//  Copyright (c) 2015 Sebastian Burek. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {
    
    var mainVC: ViewController!
    
    @IBOutlet weak var taskTextField: UITextField!
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
    
    @IBAction func cancelButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addTaskButtonTapped(sender: UIButton) {
        
        let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        let managedObjectContext = appDelegate.managedObjectContext
        
        let entitydescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: managedObjectContext!)
        let task = TaskModel(entity: entitydescription!, insertIntoManagedObjectContext: managedObjectContext!)
        task.task = taskTextField.text
        task.subtask = subtaskTextField.text
        task.date = dueDatePicker.date
        task.completed = false
        
        appDelegate.saveContext()
        
        var request = NSFetchRequest(entityName: "TaskModel")
        var error:NSError? = nil
        
        var results:NSArray = managedObjectContext!.executeFetchRequest(request, error:&error)!
        
        for res in results {
            println(res)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
