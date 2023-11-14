//
//  ViewController.swift
//  homework_tracker
//
//  Created by MILES RICHMOND on 11/13/23.
//

import UIKit


class AppData{
    static var list = [Assignment]()
    
}


class ViewController: UIViewController {
    var assignments: [Assignment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
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

