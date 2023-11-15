//
//  ListViewController.swift
//  homework_tracker
//
//  Created by MILES RICHMOND on 11/14/23.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table_outlet: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        table_outlet.delegate = self
        table_outlet.dataSource = self
        // Do any additional setup after loading the view.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! AssignmentCell
        //cell.textLabel?.text = "\(nums[indexPath.row])"
        //cell.detailTextLabel?.text = "WOWWWW"
        
        cell.date_label.text = "\(AppData.assignments[indexPath.row].dueDate)"
        cell.class_label.text = AppData.assignments[indexPath.row].fromClass
        cell.name_label.text = AppData.assignments[indexPath.row].assignmentName
        
        return cell
    }
    
    @IBAction func add_action(_ sender: UIButton) {
        performSegue(withIdentifier: "toAdd", sender: self)
    }
}
