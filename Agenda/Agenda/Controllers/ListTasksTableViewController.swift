//
//  ViewController.swift
//  Agenda
//
//  Created by Binjia Chen on 7/6/18.
//  Copyright © 2018 Selena Sui. All rights reserved.
//

import UIKit

class ListTasksTableViewController: UITableViewController {
    
    var tasks = [
        Task(title: "finish todo app", timestamp: Date(), description: "finish it"),
        Task(title: "figure this out", timestamp: Date(), description: "lets do it")]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTasksTableViewCell", for: indexPath) as! ListTasksTableViewCell
        
        let task = tasks[indexPath.row]
        
        cell.taskTitleLabel?.text = task.title
        cell.taskTimestampLabel?.text = task.timestamp.convertToString()
        cell.taskDescriptionLabel?.text = task.description
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        if identifier == "displayTask" {
            print("display task")
        }
    }

    @IBAction func taskMarkAsCompleteButtonTapped(_ sender: Any) {
    }
    
}

