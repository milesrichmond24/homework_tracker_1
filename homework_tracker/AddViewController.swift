//
//  AddViewController.swift
//  homework_tracker
//
//  Created by MILES RICHMOND on 11/14/23.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    

    @IBOutlet weak var class_picker: UIPickerView!
    @IBOutlet weak var name_textField: UITextField!
    @IBOutlet weak var description_textField: UITextField!
    @IBOutlet weak var date_input: UIDatePicker!
    
    var defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        class_picker.delegate = self
        class_picker.dataSource = self
        name_textField.delegate = self
        description_textField.delegate = self
    }

    @IBAction func add_action(_ sender: UIButton) {
        let name = name_textField.text!
        let description = description_textField.text!
        let date = date_input.date
        let className = AppData.classes[class_picker.selectedRow(inComponent: 0)]
        
        name_textField.resignFirstResponder()
        description_textField.resignFirstResponder()
        
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
        let ac = UIAlertController(title: "Add Class", message: "class", preferredStyle: .alert)
        let add = UIAlertAction(title: "Add", style: .default) { action in
            let name = ac.textFields![0].text!
            print(name)
            
            if(name == "") {
                return
            }
            
            print(name)
            
            AppData.classes.append(name)
            
            print(AppData.classes[0])
            
            
            self.class_picker.reloadAllComponents()
            
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(AppData.classes){
                self.defaults.set(encoded, forKey: "classes")
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        ac.addTextField()
        ac.textFields![0].placeholder = "Class Name"
        ac.addAction(add)
        ac.addAction(cancel)
        
        present(ac, animated: true)
    }
    
    @IBAction func delete_action(_ sender: UIButton) {
        let selectedIndex = class_picker.selectedRow(inComponent: 0)
        
        AppData.classes.remove(at: selectedIndex)
        
        class_picker.reloadAllComponents()
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.classes){
            self.defaults.set(encoded, forKey: "classes")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // Number of rows to display in each component
        return AppData.classes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return AppData.classes[row]
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
}
