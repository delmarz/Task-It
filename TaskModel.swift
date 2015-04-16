//
//  TaskModel.swift
//  TaskIt3
//
//  Created by delmarz on 1/20/15.
//  Copyright (c) 2015 delmarz. All rights reserved.
//

import Foundation
import CoreData


@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var task: String
    @NSManaged var subtask: String
    @NSManaged var date: NSDate
    @NSManaged var completed: NSNumber

}
