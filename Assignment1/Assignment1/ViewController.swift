//
//  ViewController.swift
//  Assignment1
//
//  Created by Zhanzakova Botakoz on 20.01.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, ChangeButton{
           
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return tasks.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
           
           cell.taskNameLabel.text = tasks[indexPath.row].name
           
           if tasks[indexPath.row].checked {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxFILLED "), for: UIControl.State.normal)
           } else {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxOUTLINE "), for: UIControl.State.normal)
           }
        
        cell.delegate = self
        cell.indexP = indexPath.row
        cell.tasks = tasks
 
           return cell
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let vc = segue.destination as! AddTaskController
         vc.delegate = self
     }
    
       func addTask(name: String) {
        tasks.append(Task(name: name))
        tableView.reloadData()

    }
    
    func changeButton(checked: Bool, index: Int) {
        tasks[index].checked = checked
        tableView.reloadData()
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.tasks.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    
}

    
    class Task{
        var name = ""
        var checked = false
        
        convenience init(name: String ){
            self.init()
            self.name = name
        }
    }



