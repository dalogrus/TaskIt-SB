//
//  ViewController.swift
//  TaskIt-SB
//
//  Created by Sebastian Burek on 19.04.2015.
//  Copyright (c) 2015 Sebastian Burek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var taskArray:[TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: "01/14/2014")
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Buregers", date: "01/14/2014")
        //task3 can also be defined directly in the taskArray array
        //let task3 = TaskModel(task: "Gym", subTask: "Leg Day", date: "01/14/2014")
        
        taskArray = [task1, task2, TaskModel(task: "Gym", subTask: "Leg Day", date: "01/14/2014")]
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let thisTask = taskArray[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = thisTask.date
        
        return cell
        }
    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }

}

