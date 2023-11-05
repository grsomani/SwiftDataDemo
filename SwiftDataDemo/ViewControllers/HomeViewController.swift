//
//  HomeViewController.swift
//  SwiftDataDemo
//
//  Created by Ganesh Somani on 28/10/23.
//

import UIKit
import SwiftData

class HomeViewController: UIViewController {

    @IBOutlet private weak var todoListTable: UITableView!
    private var toDoList = [ToDoData]()
    private let dbManager = DatabaseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        todoListTable.register(UITableViewCell.self, forCellReuseIdentifier: "toDoList")
        self.toDoList = dbManager.fetchToDoList() ?? []
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
            let newListData = DatabaseManager().createToDoList(title: alertController.textFields?.first?.text ?? "New List")
            guard let listVC = ListViewController.instantiateToDoList(newListData) else { return }
            self.navigationController?.pushViewController(listVC, animated: true)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(createAction)
        self.navigationController?.present(alertController, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "toDoList") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = toDoList[indexPath.row].title
        cell.selectionStyle = .none
        return cell
    }
}

