//
//  AddViewController.swift
//  homework_tracker
//
//  Created by MILES RICHMOND on 11/14/23.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var name_textField: UITextField!
    @IBOutlet weak var description_textField: UITextField!
    @IBOutlet weak var class_textField: UITextField!
    @IBOutlet weak var date_input: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func add_action(_ sender: UIButton) {
        let name = name_textField.text
        let description = description_textField.text
        let class = class_textField.text
        let date = date_input.date
        
        let newAssignment = Assignment(dueDate: date, assignmentName: name, fromClass: class, description: description)
        
        AppData.assignments.append(newAssignment)
        
        name_textField.text = ""
        description_textField.text = ""
        class_textField.text = ""
    }
}
