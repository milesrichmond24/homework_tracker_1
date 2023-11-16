//
//  ListViewController.swift
//  homework_tracker
//
//  Created by MILES RICHMOND on 11/14/23.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var table_outlet: UITableView!
    var defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        table_outlet.delegate = self
        table_outlet.dataSource = self
        if let items = defaults.data(forKey: "theList") {
                        let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Assignment].self, from: items) {
                AppData.assignments  = decoded
                        }
                }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let items = defaults.data(forKey: "theList") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Assignment].self, from: items) {
                AppData.assignments  = decoded
            }
            table_outlet.reloadData()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "assignment") as! AssignmentCell
        //cell.textLabel?.text = "\(nums[indexPath.row])"
        //cell.detailTextLabel?.text = "WOWWWW"
        
        cell.date_label.text = "\(AppData.assignments[indexPath.row].dueDate.formatted(.dateTime))"
        cell.class_label.text = AppData.assignments[indexPath.row].fromClass
        cell.name_label.text = AppData.assignments[indexPath.row].assignmentName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            AppData.assignments.remove(at: indexPath.row)
            table_outlet.reloadData()
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(AppData.assignments){
                defaults.set(encoded, forKey: "theList")
            }
           
        }
    }
    
    @IBAction func add_action(_ sender: UIButton) {
        performSegue(withIdentifier: "toAdd", sender: self)
    }
}
