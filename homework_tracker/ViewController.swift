//
//  ViewController.swift
//  homework_tracker
//
//  Created by MILES RICHMOND on 11/13/23.
//

import UIKit


class AppData : Codable{
    static var assignments = [Assignment]()
    static var classes = [String]()
    static var selected = Assignment(dueDate: Date(), assignmentName: "Ugh", fromClass: "Ugh", description: "Ugh")
}


class ViewController: UIViewController {
    
    var defaults = UserDefaults.standard

    // Labels for the presented assignment
    @IBOutlet weak var description_outlet: UILabel!
    @IBOutlet weak var class_outlet: UILabel!
    @IBOutlet weak var date_outlet: UILabel!
    @IBOutlet weak var name_outlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let items = defaults.data(forKey: "theList") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Assignment].self, from: items) {
                AppData.assignments  = decoded
            }
        }
        if let classes = defaults.data(forKey: "classes") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([String].self, from: classes) {
                AppData.classes = decoded
            }
        }
        
        if(AppData.assignments.count == 0){
            name_outlet.text = "You are a disgrace"
            date_outlet.text = "NOW!"
            class_outlet.text = "Make an assignment!!!"
            description_outlet.text = "When you make an assignment, the assignment closest to this date will show up here!"
        }
        else{
            
            print(AppData.assignments[0].dueDate.formatted(.dateTime))
            name_outlet.text = "\(soonestDate(list: AppData.assignments).assignmentName)"
            if(soonestDate(list: AppData.assignments).dueDate != Date.distantPast) {
                date_outlet.text = "Date: \(soonestDate(list: AppData.assignments).dueDate.formatted(.dateTime))"
            } else {
                date_outlet.text = "Date:"
            }
            
            class_outlet.text = "Class: \(soonestDate(list: AppData.assignments).fromClass)"
            description_outlet.text = "Desc: \(soonestDate(list: AppData.assignments).description)"
        }
    }
    
    func soonestDate(list : [Assignment]) -> Assignment {
        var closest = INT_MAX
        var best = Assignment(dueDate: Date.distantPast, assignmentName: "No New Assignment", fromClass: "", description: "");
        for guy in list{
            if(Int32(guy.dueDate.timeIntervalSinceNow) < closest /*&& guy.dueDate.timeIntervalSinceNow > -1*/){
                closest = Int32(guy.dueDate.timeIntervalSinceNow)
                best = guy
            }
        }
        
        return best
        }
    
    
}

