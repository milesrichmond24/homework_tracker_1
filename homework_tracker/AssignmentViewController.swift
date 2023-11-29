//
//  AssignmentViewController.swift
//  homework_tracker
//
//  Created by MILES RICHMOND on 11/21/23.
//

import UIKit
import SwiftUI

class AssignmentViewController: UIViewController {

    @IBOutlet weak var date_label: UILabel!
    @IBOutlet weak var desc_label: UILabel!
    @IBOutlet weak var class_label: UILabel!
    @IBOutlet weak var name_label: UILabel!
    
    var selectedAssignment: Assignment!
    
    @State private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        selectedAssignment = AppData.selected ?? Assignment(dueDate: .now, assignmentName: "", fromClass: "", description: "")
        
        date_label.text = selectedAssignment.dueDate.formatted(.dateTime)
        desc_label.text = selectedAssignment.description
        class_label.text = selectedAssignment.fromClass
        name_label.text = selectedAssignment.assignmentName
    }

    @IBAction func done_action(_ sender: UIButton) {
        
        
        
    }
}
