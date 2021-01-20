//
//  TaskCell.swift
//  Assignment1
//
//  Created by Zhanzakova Botakoz on 20.01.2021.
//

import UIKit

protocol ChangeButton {
    func changeButton(checked: Bool, index: Int)
}

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var checkBoxOutlet: UIButton!
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBAction func checkBoxAction(_ sender: Any) {
        if tasks![indexP!].checked {
                  delegate?.changeButton(checked: false, index: indexP!)
              } else {
                  delegate?.changeButton(checked: true, index: indexP!)
              }
    }
    
    var delegate: ChangeButton?
    var indexP: Int?
    var tasks: [Task]?
}
