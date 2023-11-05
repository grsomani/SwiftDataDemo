//
//  DatabaseManager.swift
//  SwiftDataDemo
//
//  Created by Ganesh Somani on 05/11/23.
//

import SwiftData

protocol ToDoListManager {
    func fetchToDoList() -> [ToDoData]?
    func createToDoList(title: String) -> ToDoData
}

class DatabaseManager: ToDoListManager {
    private var modelContainer: ModelContainer?
    private let modelConfig = ModelConfiguration()
    private var modelContext: ModelContext?
    
    init() {
        guard let modelContainer = try? ModelContainer(for: ToDoData.self, configurations: modelConfig) else {
            return
        }
        self.modelContainer = modelContainer
        self.modelContext = ModelContext(modelContainer)
    }

    func fetchToDoList() -> [ToDoData]? {
        let fetchDesc: FetchDescriptor<ToDoData> = FetchDescriptor()
        let toDoList = try? self.modelContext?.fetch(fetchDesc)
        return toDoList
    }
    
    func createToDoList(title: String) -> ToDoData {
        let newListData = ToDoData(title: title)
        self.modelContext?.insert(newListData)
        try? self.modelContext?.save()
        return newListData
    }
}
