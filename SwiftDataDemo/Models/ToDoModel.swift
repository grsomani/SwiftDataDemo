//
//  ToDoModel.swift
//  SwiftDataDemo
//
//  Created by Ganesh Somani on 28/10/23.
//

import Foundation
import SwiftData

@Model
class ToDoData {
    var title: String
    var createdDate: Date
    var lastEditedDate: Date
    var list: [ToDoTask]?
    
    init(title: String, createdDate: Date = Date(), lastEditedDate: Date = Date(), list: [ToDoTask]?) {
        self.title = title
        self.createdDate = createdDate
        self.lastEditedDate = lastEditedDate
        self.list = list
    }
}

@Model
class ToDoTask {
    var taskTitle: String
    var completed: Bool
    
    init(taskTitle: String, completed: Bool = false) {
        self.taskTitle = taskTitle
        self.completed = completed
    }
}
