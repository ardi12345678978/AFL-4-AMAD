//
//  TaskItem.swift
//  afl4
//
//  Created by SIFT - Telkom DBT Air 6 on 29/05/22.
//

import SwiftUI
import RealmSwift

class TaskItem: Object,Identifiable{
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var taskTitle: String
    @Persisted var taskDate: Date = Date()
    
    // task status..
    @Persisted var taskStatus: TaskStatus = .pending
}

enum TaskStatus: String,PersistableEnum{
    case missed = "Missed"
    case completed = "Completed"
    case pending = "Pending"
}
