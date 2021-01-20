//
//  AddTaskController.swift
//  Assignment1
//
//  Created by Zhanzakova Botakoz on 20.01.2021.
//

import UIKit

protocol AddTask {
    func addTask(name: String)
}

class AddTaskController: UIViewController {

    
    @IBAction func addAction(_ sender: Any) {
        if taskNameOutlet.text != ""{
            delegate?.addTask(name: taskNameOutlet.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBOutlet weak var taskNameOutlet: UITextField!

    var delegate: AddTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
}
