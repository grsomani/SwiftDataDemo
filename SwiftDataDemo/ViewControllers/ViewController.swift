//
//  ViewController.swift
//  SwiftDataDemo
//
//  Created by Ganesh Somani on 28/10/23.
//

import UIKit

class ViewController: UIViewController {

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
            // create new model here
            // navigate to new screen for list creation
        }
        alertController.addAction(cancelAction)
        alertController.addAction(createAction)
        self.navigationController?.present(alertController, animated: true)
    }
}

