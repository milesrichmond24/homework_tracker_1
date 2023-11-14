//
//  ViewController.swift
//  homework_tracker
//
//  Created by MILES RICHMOND on 11/13/23.
//

import UIKit

class ViewController: UIViewController {
    var assignments: [Assignment] = []

    @IBOutlet weak var description_outlet: UILabel!
    @IBOutlet weak var class_outlet: UILabel!
    @IBOutlet weak var date_outlet: UILabel!
    @IBOutlet weak var name_outlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    // Segue to ListViewController
    @IBAction func list_action(_ sender: UIButton) {
        
    }
}

