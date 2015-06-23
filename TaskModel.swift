//
//  TaskModel.swift
//  TaskIt-SB
//
//  Created by Sebastian Burek on 21.06.2015.
//  Copyright (c) 2015 Sebastian Burek. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subtask: String
    @NSManaged var task: String

}
