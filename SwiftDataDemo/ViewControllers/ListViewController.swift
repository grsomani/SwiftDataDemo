//
//  ListViewController.swift
//  SwiftDataDemo
//
//  Created by Ganesh Somani on 28/10/23.
//

import UIKit
import SwiftData

class ListViewController: UIViewController {
    
    private var toDoList: ToDoData? = nil
    private var modelContainer: ModelContainer?
    
    class func instantiateToDoList(_ toDoList: ToDoData?) -> ListViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let listVC = storyboard.instantiateViewController(withIdentifier: "toDoListVC") as? ListViewController else {
            return nil
        }
        listVC.toDoList = toDoList
        return listVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        self.title = toDoList?.title
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTask))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc private func addNewTask() {
    }
}
