//
//  HomeViewController.swift
//  SwiftDataDemo
//
//  Created by Ganesh Somani on 28/10/23.
//

import UIKit
import SwiftData

class HomeViewController: UIViewController {

    private var modelContainer: ModelContainer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        self.title = "ToDo List"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewToDoList))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc private func addNewToDoList() {
        let alertController = UIAlertController(title: "New ToDo List", message: "What is this todo list regarding?", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter List Title here"
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let createAction = UIAlertAction(title: "Create", style: .default) { _ in
            let modelConfig = ModelConfiguration()
            do {
                self.modelContainer = try ModelContainer(for: ToDoData.self, configurations: modelConfig)
            } catch {
                fatalError("Could not initialize ModelContainer")
            }
            let newListData = ToDoData(title: alertController.textFields?.first?.text ?? "New List", list: [])
            guard let listVC = ListViewController.instantiateToDoList(newListData) else { return }
            self.navigationController?.pushViewController(listVC, animated: true)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(createAction)
        self.navigationController?.present(alertController, animated: true)
    }
}

