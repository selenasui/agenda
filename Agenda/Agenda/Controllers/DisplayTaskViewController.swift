//
//  DisplayTaskViewController.swift
//  Agenda
//
//  Created by Binjia Chen on 7/8/18.
//  Copyright © 2018 Selena Sui. All rights reserved.
//

import UIKit

class DisplayTaskViewController: UIViewController {
    
    var task: Task?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let task = task {
            titleTextField.text = task.title
            contentTextView.text = task.content
        } else {
            titleTextField.text = ""
            contentTextView.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        switch identifier {
        case "save" where task != nil:
            task?.title = titleTextField.text ?? ""
            task?.content = contentTextView.text ?? ""
            task?.timestamp = Date()
            
            CoreDataHelper.saveTask()
        
        case "save" where task == nil:
            let task = CoreDataHelper.newTask()
            task.title = titleTextField.text ?? ""
            task.content = contentTextView.text ?? ""
            task.timestamp = Date()
            
            CoreDataHelper.saveTask()
            
        case "cancel":
            print("cancel bar button item tapped")
            
        default:
            print("Unexpected segue identifier")
        }
        
        
    }
}
