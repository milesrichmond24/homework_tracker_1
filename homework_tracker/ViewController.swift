//
//  ViewController.swift
//  homework_tracker
//
//  Created by MILES RICHMOND on 11/13/23.
//

import UIKit


class AppData{
    static var assignments = [Assignment]()
    
}


class ViewController: UIViewController {
    

    // Labels for the presented assignment
    @IBOutlet weak var description_outlet: UILabel!
    @IBOutlet weak var class_outlet: UILabel!
    @IBOutlet weak var date_outlet: UILabel!
    @IBOutlet weak var name_outlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    // Segue to ListViewController
    @IBAction func list_action(_ sender: UIButton) {
        performSegue(withIdentifier: "toList", sender: self)
    }
    
    
    func soonestDate(list : [Assignment]) -> Assignment {
        var closest = INT_MAX
        var best = Assignment(dueDate: Date(), assignmentName: "", fromClass: "", description: "")
        for guy in list{
            if(Int32(guy.dueDate.timeIntervalSinceNow) < closest && guy.dueDate.timeIntervalSinceNow > -1){
                closest = Int32(guy.dueDate.timeIntervalSinceNow)
                best = guy
            }
        }
        return best
        }
    
    
}

