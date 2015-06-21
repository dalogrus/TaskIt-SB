//
//  AddTaskViewController.swift
//  TaskIt-SB
//
//  Created by Sebastian Burek on 29.04.2015.
//  Copyright (c) 2015 Sebastian Burek. All rights reserved.
//

import UIKit

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
        var task = TaskModel(task: taskTextField.text, subTask: subtaskTextField.text, date: dueDatePicker.date, completed: false)
        //println("before append", mainVC.taskArray.count)
        mainVC?.baseArray[0].append(task)
        //println("after append", mainVC.taskArray.count)
        mainVC.tableView.reloadData()
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
