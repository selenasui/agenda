//
//  ViewController.swift
//  Agenda
//
//  Created by Binjia Chen on 7/6/18.
//  Copyright © 2018 Selena Sui. All rights reserved.
//

import UIKit

class ListTasksTableViewController: UITableViewController {
    
    var tasks = [Task]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var completedTasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = CoreDataHelper.retrieveTasks()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTasksTableViewCell", for: indexPath) as! ListTasksTableViewCell
        
        let task = tasks[indexPath.row]
        
        cell.taskTitleLabel.text = task.title
        cell.taskTimestampLabel.text = task.timestamp?.convertToString() ?? "unknown"
        
        let content = task.content
        let contentLines = content?.components(separatedBy: "\n")
        if let contentLines = contentLines {
            cell.taskDescriptionLabel.text = contentLines[0]
        } else {
            cell.taskDescriptionLabel.text = content
        }
        
        cell.taskMarkAsCompleteButton.layer.borderWidth = 1.5
        cell.taskMarkAsCompleteButton.layer.borderColor = UIColor.init(red: 194/255, green: 151/255, blue: 255/255, alpha: 1).cgColor
        cell.taskMarkAsCompleteButton.clipsToBounds = true
        
        cell.onButtonTapped = { (cell) in
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "listTasksTableViewCell", for: indexPath) as! ListTasksTableViewCell
            
            let taskToRemove = self.tasks[indexPath.row]
            
            CoreDataHelper.deleteNote(task: taskToRemove)
            
            self.tasks = CoreDataHelper.retrieveTasks()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let taskToDelete = tasks[indexPath.row]
            CoreDataHelper.deleteNote(task: taskToDelete)
            
            tasks = CoreDataHelper.retrieveTasks()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        switch identifier {
        case "displayTask":
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let task = tasks[indexPath.row]
            let destination = segue.destination as! DisplayTaskViewController
            destination.task = task
            
        case "addTask":
            print("create task bar button item tapped")
            
        default:
            print("Unexpected segue identifier")
        }
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        tasks = CoreDataHelper.retrieveTasks()
    }
    
}

