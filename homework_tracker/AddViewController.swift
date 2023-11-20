//
//  AddViewController.swift
//  homework_tracker
//
//  Created by MILES RICHMOND on 11/14/23.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var name_textField: UITextField!
    @IBOutlet weak var description_textField: UITextField!
    @IBOutlet weak var date_input: UIDatePicker!
    
    var defaults = UserDefaults.standard
    var className: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func add_action(_ sender: UIButton) {
        let name = name_textField.text!
        let description = description_textField.text!
        let date = date_input.date
        
        let newAssignment = Assignment(dueDate: date, assignmentName: name, fromClass: className, description: description)
        
        AppData.assignments.append(newAssignment)
        
        name_textField.text = ""
        description_textField.text = ""
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.assignments){
                           defaults.set(encoded, forKey: "theList")
                       }
    }
    
    @IBAction func add_class() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.classes){
            defaults.set(encoded, forKey: "classes")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return AppData.classes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // Number of rows to display in each component
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return AppData.classes[component]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        className = AppData.classes[row]
    }
}
